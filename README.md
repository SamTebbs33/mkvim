mivim is a small and simple shell script that creates a new vim profile for you.

Usage
=====

Make sure that you're in the same directory as mkvim.sh and execute either of the following commands, where *name* is the name of your profile.

...
sh mkvim.sh name
sh mkvim.sh name -c # -c removes all previously created vim aliases
...

This will then create a new directory with the following structure

...
name
    -> .vim
	-> .vimrc
...

It will also make an alias in your ~/.vim_aliases file (it will created if it doesn't exist), so that you can then run your new profile with

...
vimname
...

In order for the alias to be useable, you will need to add the following lines to your ~/.bashrc file

...
if [ -a ~/.vim_aliases ]; then
	. ~/.vim_aliases
fi
...

This will make it so that the .vim_aliases file is loaded when a new bash session is started, start a new terminal window for this.

When the profile is created, all lines from the .vimrc_template file is put into the new profile's .vim directory, in this file, you can add any configuration magic that should be common to all new profiles.