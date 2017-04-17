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

## The object of the exercise

The object of this exercise was to create two modules:

One that installs ssh and changes the default port to something else. In this case to 2222.

And a second module that install apache2 webserver and changes default website to something else.

I started with the ssh module.

### Creating the ssh module

```

class ssh{	
	package{"ssh":
		ensure => "installed",
	}
	
	service{"sshd":
		ensure => "running",
		enable => "true",
		require => Package["ssh"],
	}
	
	file{"/etc/ssh/sshd_config":
		content => template('ssh/sshd_config.erb'),
		require => Package["ssh"],
		notify => Service["sshd"],
	}
}
```
Above you can see the ssh module I created. I ran it with the following command.

```
sudo puppet apply --modulepath ~/PuppetModules/thirdhomework/modules/ -e 'class {'ssh':}'
```
After running the module I got the following message. I already had the ssh installed before I ran the module so that is why the output does not indicate
that the ssh package has been installed. But it does indicate that the sshd_config file has changed and that the service is running after the changes have been made.
```
Notice: Compiled catalog for krutelpc.pp.htv.fi in environment production in 1.34 seconds
Notice: /Stage[main]/Ssh/File[/etc/ssh/sshd_config]/content: content changed '{md5}bd3a2b95f8b4b180eed707794ad81e4d' to '{md5}1b50a03f847fd86f9e350c0fd54d7c62'
Notice: /Stage[main]/Ssh/Service[sshd]/ensure: ensure changed 'stopped' to 'running'
Notice: Finished catalog run in 0.40 seconds
```
### Creating the apacheconf module




```
Notice: Compiled catalog for krutelpc.pp.htv.fi in environment production in 1.08 seconds
Notice: /Stage[main]/Apacheconf/Package[apache2]/ensure: ensure changed 'purged' to 'present'
Notice: /Stage[main]/Apacheconf/File[/etc/apache2/sites-enabled/000-default.conf]/ensure: removed
Notice: /Stage[main]/Apacheconf/File[/home/teemu/public_html]/ensure: created
Notice: /Stage[main]/Apacheconf/File[/home/teemu/public_html/index.html]/ensure: defined content as '{md5}b10a8db164e0754105b7a99be72e3fe5'
Notice: /Stage[main]/Apacheconf/File[/etc/apache2/sites-available/teemu.conf]/ensure: defined content as '{md5}58cbeda116795d35af3141728aed3b1d'
Notice: /Stage[main]/Apacheconf/File[/etc/apache2/sites-enabled/teemu.conf]/ensure: created
Notice: /Stage[main]/Apacheconf/Service[apache2]: Triggered 'refresh' from 2 events
Notice: Finished catalog run in 25.97 seconds
```
