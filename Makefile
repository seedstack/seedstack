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
	git submodule foreach git stash && git checkout master && git pull --ff-only upstream master:master

# Set a submodule origin to a specific fork url and rename the official remote to upstream 
setup-fork:
	@read -p "Enter module name: " forkname; \
	read -p "Enter fork url: " forkurl; \
	(cd $$forkname && git remote add origin $$forkurl && git fetch origin && git branch master --set-upstream-to origin/master); \
	echo "Done.";
