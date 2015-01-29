echo "Copying Vim profile settings: $1"
if [ ! -d "$1" ]; then
	echo "No such profile" 
	exit
fi

if [ ! -d "$1/.vim" ]; then
	echo "No such .vim"
	exit
fi

if [[ ! -d vim_template ]]; then
	mkdir vim_template
fi

sudo cp -r "$1/.vim" vim_template

if [ ! -f "$1/.vim/.vimrc" ]; then
	echo "No such .vimrc"
	exit
fi

sudo cp "$1/.vim/.vimrc" vimrc_template
