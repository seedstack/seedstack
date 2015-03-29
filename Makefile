MVN_THREADS=1C

# Run the showcase webapp in jetty
run-showcase: build-showcase
	(cd showcase/web && mvn jetty:run)

# Init the submodules, set the official repo as remote upstream and checkout master
init:
	git submodule update --init
	git remote rename origin upstream
	git submodule foreach git remote rename origin upstream
	git submodule foreach git checkout master

# Fetch all submodules upstream
fetch:
	git submodule foreach git fetch upstream

# FF pull of all submodules from upstream
update:
	git submodule foreach git pull --ff-only upstream master:master

# Set a submodule origin to a specific fork url and rename the official remote to upstream 
setup-fork:
	@read -p "Enter module name: " forkname; \
	read -p "Enter fork url: " forkurl; \
	(cd $$forkname && git remote add origin $$forkurl && git fetch origin && git branch master --set-upstream-to origin/master); \
	echo "Done.";

# Clean all the build outputs
clean:
	find . -maxdepth 2 -name "pom.xml" -exec mvn -f {} clean \;
	find . -maxdepth 2 -name "gruntfile.js" -exec grunt --gruntfile {} clean \;
	find . -maxdepth 2 -name "node_modules" -exec rm -rf {} \;

# Available build targets		
build-poms: 
	(cd poms && mvn -T${MVN_THREADS} install)

build-seed:
	(cd seed && mvn -T${MVN_THREADS} install)

build-w20:
	(cd w20 && npm install && grunt)

build-w20-business-theme:
	(cd w20-business-theme && npm install && grunt)

build-business:
	(cd business && mvn -T${MVN_THREADS} install)

build-io-function:
	(cd io-function && mvn -T${MVN_THREADS} install)

build-i18n-function:
	(cd i18n-function && mvn -T${MVN_THREADS} install)

build-w20-function:
	(cd w20-function && mvn -T${MVN_THREADS} install)

build-distribution:
	(cd distribution && mvn -T${MVN_THREADS} install)

build-ecommerce-domain-sample:
	(cd ecommerce-domain-sample && mvn -T${MVN_THREADS} install)

build-showcase:
	(cd showcase && mvn -T${MVN_THREADS} install)
