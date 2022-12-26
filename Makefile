BASH=bash
SHELL=sh



# All
#===============================================================
all: install

install: ## Set dotfiles at the home directory
	${BASH} -c "$$(curl -L https://raw.githubusercontent.com/GotoRen/dotfiles/master/bin/install.sh)"

update:
	git pull https://github.com/GotoRen/dotfiles.git; make setup

setup: ## Run all bin/shell
	${SHELL} ./bin/setup.sh



# Install tools
#===============================================================
asdf-install: ## Install asdf plugins
	${SHELL} ./bin/asdf.sh

brew-install: ## Install brew formulas
	${SHELL} ./bin/brew.sh

gcloud-install: ## Install google-cloud-sdk plugins
	${SHELL} ./bin/gcloud.sh

go-install: ## Install go packages
	${SHELL} ./bin/go-package.sh

pip3-install: ## Install pip3 packages
	${SHELL} ./bin/pip3-package.sh

gem-install: ## Install gem rakes
	${SHELL} ./bin/gem-rake.sh

nvm-install: ## Install nvm packages
	${SHELL} ./bin/nvm.sh

vscode-install: ## VSCode settings
	${SHELL} ./bin/vscode/vscode.sh



# Files for each environment
#===============================================================
finder-conf: ## Remove annoying metafiles
	${SHELL} ./bin/finder-configs.sh

ln-conf: ## Configure symbolic link
	${SHELL} ./bin/ln.sh

arch-conf: ## Architecture dependent configuration
	${SHELL} ./bin/multi-arch.sh



# Makefile config
#===============================================================
help: ## Display this help screen
	echo "Usage: make [task]\n\nTasks:"
	perl -nle 'printf("    \033[33m%-30s\033[0m %s\n",$$1,$$2) if /^([a-zA-Z_-]*?):(?:.+?## )?(.*?)$$/' $(MAKEFILE_LIST)

.SILENT: help

.PHONY: $(shell egrep -o '^(\._)?[a-z_-]+:' $(MAKEFILE_LIST) | sed 's/://')
