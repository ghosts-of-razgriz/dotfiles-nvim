include ~/code/dotfiles/make/help.mk

.PHONY: help clean clean/plugins clean/compiled

help: ## Show this help prompt
	$(call HELP, "Neovim")

clean: clean/compiled clean/plugins ## clean all

clean/compiled: ## delete the compiled packer config
	@rm -f ./plugin/packer_compiled.lua
	@echo compiled config removed

clean/plugins: ## delete the downloaded plugins
	@rm -rf ./pack/packer/opt
	@rm -rf ./pack/packer/start
	@echo downloaded plugins removed


