#init script

#link config files to home directory
ln -s ~/Development/Setup/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Development/Setup/dotfiles/.vimrc ~/.vimrc

#installs if linux
sudo yum install the_silver_searcher
