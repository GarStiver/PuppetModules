# Exercise 3: Configuring applications

### Disclaimer:

This post is for the Linux's centralized contro -course (ICT4TN011-11) held by Tero Karvinen in Haaga-Helia University of Applied Sciences.

The puppet modules created during this exercise are free to use.

### PC in use:

OS: Xubuntu 16.04.1 LTS

CPU: AMD A10-4655 APU 2.0GHz

RAM: 8.00gb

### Preparations for the exercise

Before starting the actual exercise I did the necessary preparations as follows:

```
$sudo apt-get update

$sudo apt-get -y upgrade
```
## Starting the exercise

### Instructions

The objective of this exercise was to create a package configuration -module using Puppet and write a blog post about it using Git.

## Creating a new module

Notice: Compiled catalog for krutelpc.pp.htv.fi in environment production in 1.34 seconds
Notice: /Stage[main]/Ssh/File[/etc/ssh/sshd_config]/content: content changed '{md5}bd3a2b95f8b4b180eed707794ad81e4d' to '{md5}1b50a03f847fd86f9e350c0fd54d7c62'
Notice: /Stage[main]/Ssh/Service[sshd]/ensure: ensure changed 'stopped' to 'running'
Notice: Finished catalog run in 0.40 seconds

