dotfiles
========

Nice [resource](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/) to get you started.

### Current dotfiles
- bashrc
- zshrc - currently in use with powerline
- tcshrc - not used anymore
- tmux.conf - has powerline, some bindings
- vim - look up file directories to check out all the plugins I'm using

## On Linux
---------------------
I recommend you first install these programs:

	sudo apt-get install vim
    sudo apt-get install zsh
    sudo apt-get install tmux
    sudo apt-get install python
    sudo apt-get install python-pip git


Powerline:

	pip install --user git+git://github.com/Lokaltog/powerline
    
    
Now proceed with the dotfiles:    

    cd ~
	git clone https://github.com/shaabhishek/dotfiles.git dotfiles
	cd dotfiles
    git submodule update --init
    chmod +x makesymlinks.sh
	./makesymlinks.sh
    

## Upgrading a plugin bundle
-------------------------
At some point in the future, the fugitive plugin might be updated.
To fetch the latest changes, go into the fugitive repository, and pull the latest version:

	cd ~/.vim/bundle/fugitive
	git pull origin master
    
    
## Upgrading all bundled plugins
-----------------------------
You can use the foreach command to execute any shell script in from the root of all submodule directories. To update to the latest version of each plugin bundle, run the following:


	cd ~/dotfiles
    git submodule foreach git pull origin master
    

## On Windows, like this:
-------
Your _vimrc file if you're using gVim for Windows: (make sure you update the path with the dotfiles files on your filesystem:

	set runtimepath^=C:\Users\9004032456\Dropbox\abhishek-common\dotfiles
	call pathogen#runtime_prepend_subdirectories(expand('~/Dropbox/abhishek-common/dotfiles/vim/bundle'))
	source C:\Users\9004032456\Dropbox\abhishek-common\dotfiles\vimrc


