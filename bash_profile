if [ -d ~/bin ]; then
	export PATH=:~/bin:$PATH
fi

# Source bashrc if it exists
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi