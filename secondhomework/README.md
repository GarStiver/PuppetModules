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

After creating the init.pp I started programming the puppet module. The first thing I decided to do with the module was I simply want it to install apache2 on my system.

```
class apacheconf {
	package {'apache2':
		ensure => 'installed',
	}
}
```
Next I ran the module I created above

> $sudo puppet apply -e 'class {'apacheconf':}'

I received the following output
```
Notice: Compiled catalog for krutelpc.pp.htv.fi in environment production in 0.78 seconds
Notice: /Stage[main]/Apache/Package[apache2]/ensure: ensure changed 'purged' to 'present'
Notice: Finished catalog run in 21.98 seconds
```
Next I decided to add the File -resource to the module. 

```
class apacheconf {
	package {'apache2':
		ensure => 'installed',
	}
	file {'/var/www/html/index.hmtl':
		content => 'Life is more than a simple series of ones and zeroes',
	}
}
```
Again I ran the module to check the results

> $sudo puppet apply -e 'class {'apacheconf':}'

```
Notice: Compiled catalog for krutelpc.pp.htv.fi in environment production in 0.78 seconds
Notice: /Stage[main]/Apache/File[/var/www/html/index.html]/content: content changed '{md5}319daf69bc09fc4232402a0488a2ef56' to '{md5}b10a8db164e0754105b7a99be72e3fe5'
Notice: Finished catalog run in 21.98 seconds
```
Also checked the browser to actually see the changes
![alt text](https://github.com/GarStiver/PuppetModules/tree/master/secondhomework/localhost.png "locahost picture")

Lastly I added the part where module ensures that apache2 is running

```
class apacheconf {
	package {'apache2':
		ensure => 'installed',
		before => Service['apache2'],
	}
	file {'/var/www/html/index.html':
		content => "Life is more than a simple series of ones and zeroes",
		before => Service ['apache2'],
	}
	service {'apache2':
		ensure => 'running',
		require => [
			Package['apache2'],
			File['/var/www/html/index.html'],
		]
	}
}
```

Also for the module to run the resources in certain order I added before and require attributes to the module. Here both package and file run before service and service requires both package and file to have run before executing the ensure => running command.

Again I ran the module

> $sudo puppet apply -e 'class {'apacheconf':}'

```
Notice: Compiled catalog for krutelpc.pp.htv.fi in environment production in 1.11 seconds
Notice: /Stage[main]/Apacheconf/Package[apache2]/ensure: ensure changed 'purged' to 'present'
Notice: /Stage[main]/Apacheconf/File[/var/www/html/index.html]/content: content changed '{md5}b10a8db164e0754105b7a99be72e3fe5' to '{md5}319daf69bc09fc4232402a0488a2ef56'
Notice: Finished catalog run in 22.31 seconds
```

## Conclusion

This exercise took a couple of hours to finish. The hardest part was propably to write everything in markdown as I have never used that before. The actual exercise to create the puppet module was not too hard. In the next exercise I am propably going to continue from here using the same module and editing it further.

## Sources

Tero Karvinen
http://terokarvinen.com/2017/aikataulu-%e2%80%93-linuxin-keskitetty-hallinta-%e2%80%93-ict4tn011-11-%e2%80%93-loppukevat-2017-p2

Puppet
https://docs.puppet.com/puppet/latest/lang_relationships.html#packagefileservice

Github
https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#lines
