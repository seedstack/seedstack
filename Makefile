MVN_THREADS=1C

# Run the showcase webapp in jetty
run-showcase: build-showcase
	(cd showcase/web && mvn jetty:run)

# Initialize the submodules
init:
	git submodule init
	git submodule update

# Update all code to the latest version
fetch:
	git submodule foreach git fetch upstream

# Set a submodule origin to a specific fork url and rename the official remote to upstream 
set-fork:
	@read -p "Enter module name: " forkname; \
	read -p "Enter fork url: " forkurl; \
	(cd $$forkname && git remote rename origin upstream && git remote add origin $$forkurl); \
	echo "Done.";

# Build all the stack
build: build-distribution build-showcase

# Clean all the build outputs
clean:
	find . -maxdepth 2 -name "pom.xml" -exec mvn -f {} clean \;
	find . -maxdepth 2 -name "gruntfile.js" -exec grunt --gruntfile {} clean \;
	find . -maxdepth 2 -name "node_modules" -exec rm -rf {} \;

# Available build targets		
build-poms: 
	(cd poms && mvn -T${MVN_THREADS} install)

build-seed: build-poms
	(cd seed && mvn -T${MVN_THREADS} install)

build-w20:
	(cd w20 && npm install && grunt)

build-w20-business-theme: build-w20
	(cd w20-business-theme && npm install && grunt)

build-business: build-seed build-poms
	(cd business && mvn -T${MVN_THREADS} install)

build-io-function: build-seed build-poms
	(cd io-function && mvn -T${MVN_THREADS} install)

build-i18n-function: build-business build-seed build-poms
	(cd i18n-function && mvn -T${MVN_THREADS} install)

build-w20-function: build-seed build-poms build-w20
	(cd w20-function && mvn -T${MVN_THREADS} install)

build-distribution: build-poms build-seed build-business build-w20-function build-io-function build-i18n-function
	(cd distribution && mvn -T${MVN_THREADS} install)

build-ecommerce-domain-sample: build-distribution
	(cd ecommerce-domain-sample && mvn -T${MVN_THREADS} install)

build-showcase: build-distribution build-ecommerce-domain-sample
	(cd showcase && mvn -T${MVN_THREADS} install)
