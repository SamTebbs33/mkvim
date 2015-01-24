# Add following lines to .bashrc to enable vim aliases, optionally change all occurrences of vim_aliases to another file. You will either need to reload .bashrc after this script has run, or start a new bash session
# if [ -f ~/.vim_aliases]; then
# . ~/.vim_aliases
# fi

if [ $2 == "-c" ]; then
	echo Cleaning vim aliases
	rm ~/.vim_aliases
fi

# Create the vim_template folder if it doesn’t exist
if [ ! -a vim_template ]; then
	mkdir vim_template
fi

echo "Making a new vim profile: $1"
mkdir $1
cd $1
echo "The .vim folder is inside this directory. Enable hidden files to see it." > README.txt

# Get current directory and then make it relative to $HOME
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DIR=~${DIR/$HOME/}

mkdir .vim
mkfile 0 .vim/.vimrc

# Create the ~/.vim_aliases file if it doesn’t exist
if [ ! -a ~/.vim_aliases ]; then
	mkfile 0 ~/.vim_aliases
fi

# Set up needed directories and the alias
VIM2=$DIR"/.vim"
VIM2RC=$VIM2"/.vimrc"
VIMALIAS="alias vim$1=\"vim -u $VIM2RC\""
printf "$VIMALIAS\n" >> ~/.vim_aliases

cp ../vimrc_template .vim/.vimrc
cp -r ../vim_template/. .vim/
cd ..
