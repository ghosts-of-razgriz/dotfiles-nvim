export NVIM_APPNAME := "nvim"

default:
	@just --list

clean: clean-plugins clean-state

clean-plugins:
	rm -rf $HOME/.local/share/$NVIM_APPNAME
	mkdir -p $HOME/.local/share/$NVIM_APPNAME/site

clean-state:
	rm -rf $HOME/.local/state/$NVIM_APPNAME
	mkdir -p $HOME/.local/state/$NVIM_APPNAME/swap
	mkdir -p $HOME/.local/state/$NVIM_APPNAME/undo
