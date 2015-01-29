MKVim is a small and simple shell script that creates a new vim profile. Each profile has a separate .vim runtime and configuration from the rest. I have also included the cpvim script, which copies a profile's configuration settings into your template files.

Contents
========

* <a href="#Features">Features</a>
* <a href="#Installation">Installation</a>
* <a href="#Usage">Usage</a>
* <a href="#Example">Example</a>

<a id="Features">Features</a>
========

* Each profile's runtime and configuration is separate from other profiles
* Adds an alias so that the new profile can easily be run with one command
* Adds common configuration settings to each newly created profile

<a id="Installation">Installation</a>
============

By itself, MKVim will only work on a UNIX base system (such as Mac OS X, it may work on Linux, but this hasn't been tested). To use it with Windows, you will need to download and install <a href="https://www.cygwin.com">Cygwin</a>, then run it from there.

To install MKVim, just download this repo as a zip (see the button to the left) and extract it somewhere, or clone the repo

```
$ git clone https://github.com/SamTebbs33/mkvim.git
```

You can then enter the mkvim directory and start adding profiles!

<a id="Usage">Usage</a>
=====

Make sure that you're in the same directory as mkvim.sh and execute either of the following commands, where *name* is the name of your profile.

```
$ sh mkvim.sh name
$ sh mkvim.sh name -c # -c removes all previously created Vim profile aliases
```

This will then create a new directory with the following structure

```
name
    -> .vim
        -> .vimrc
```

When the profile is created, the text inside vimrc_template is added to the profile's .vimrc, and the contents of vim_template is copied to the profile's .vim directory. This allows you to provide common configurations and .vim contents that is added to each profile.

It will also make an alias in your ~/.vim_aliases file (it gets created if it doesn't exist), so that you can then run your new profile with

```
$ vimname
```

In order for the alias to be useable, you will need to add the following lines to your ~/.bashrc file

```
if [ -a ~/.vim_aliases ]; then
	. ~/.vim_aliases
fi
```

This will make it so that the .vim_aliases file is loaded when a new bash session is started, start a new terminal window for this.

Now, each change you make to a profile's configuration and .vim folder will be specific to that profile and won't interfere with any others!

You can copy a profile's configuration (the .vim directory and .vimrc file) to your vim_teplate and vimc_template by using the cpvim.sh script.

```
sh cpvim.sh name
```

Where *name* is the name of your profile


<a id="Example">Example</a>
=======

For example, if I wanted to make a new profile for Java development, I would run the following command

```
$ sh mkvim.sh java
```

This would create the following directory structure

```
java
    -> .vim
        -> .vimrc
```

After reloading the .bashrc file or starting a new bash session, I could start Vim with my new profile by running

```
$ vimjava
```
