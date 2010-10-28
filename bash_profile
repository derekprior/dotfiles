if [ -d ~/bin ]; then
	export PATH=:~/bin:$PATH
fi

# Source Machine Local Settings for overrides or additions
if [ -f ~/.bash_profile.local ]; then
	source ~/.bash_profile.local
fi

# Source bashrc if it exists
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi