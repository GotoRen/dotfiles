all: install


# All
#===============================================================
install: ## Set dotfiles at the home directory
	bash -c "$(curl -L https://raw.githubusercontent.com/GotoRen/dotfiles/master/bin/install.sh)"

setup: ## Run all bin/shell
	sh ./bin/setup.sh


# Install tools
#===============================================================
asdf-plugin: ## Install asdf plugins
	sh ./bin/asdf.sh

brew-formulas: ## Install brew formulas
	sh ./bin/brew.sh

gcloud-plugin: ## Install google-cloud-sdk plugins
	sh ./bin/gcloud.sh

go-package: ## Install go packages
	sh ./bin/go-package.sh

nvm-package: ## Install nvm packages
	sh ./bin/nvm.sh


# Files for each environment
#===============================================================
finder-conf: ## Remove annoying metafiles
	sh ./bin/finder-configs.sh

set-ln: ## Configure symbolic link
	sh ./bin/ln.sh

multi-arch: ## Architecture dependent configuration
	sh ./bin/multi-arch.sh


# Makefile config
#===============================================================
help: ## Display this help screen
	echo "Usage: make [task]\n\nTasks:"
	perl -nle 'printf("    \033[33m%-30s\033[0m %s\n",$$1,$$2) if /^([a-zA-Z_-]*?):(?:.+?## )?(.*?)$$/' $(MAKEFILE_LIST)

.SILENT: help

.PHONY: $(shell egrep -o '^(\._)?[a-z_-]+:' $(MAKEFILE_LIST) | sed 's/://')
