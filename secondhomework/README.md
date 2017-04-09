# Exercise 2: Package-File-Service

### Disclaimer:
This post is for the Linux's centralized control -course (ICT4TN011-11) held by Tero Karvinen in Haaga-Helia University of Applied Sciences.

The puppet modules created during this exercise are free to use.

### PC in use:

OS: Xubuntu 16.04.1 LTS

CPU: AMD A10-4655 APU 2.0GHz

RAM: 8.00gb

### Preparations for the exercise

Before starting to do the actual exercies I did the necessary preparations as follow:

> $sudo apt-get update

> $sudo apt-get -y upgrade

## Starting the exercise

### Instructions

The objective of this exercise was to create a package-file-service -module using Puppet and write a blog post about it using Git.

### Creating a new module

For this exercise I decided to create a module that installs apache2 web server, creates a new index.html -page for the said web server and ensures that the web server is running. As I already had apache2 I first had to uninstall it from my system.

> $sudo apt-get purge apache2

After removing the service I created a new folder in the /etc/puppet -folder for the new module

> $mkdir /etc/puppet/modules/apacheconf/manifests

And after creating the folder I created the init.pp -file

> sudoedit init.pp


