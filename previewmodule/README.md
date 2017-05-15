# My own module

The point of this module is to install Atom, mysql-server and git to function as a proper software development enviroment for future projects.

### Requirements

To get the enviroment working I figured I would need to install atleast git, mysql-server and Atom to get a proper enviroment working and running. Also to create a user for the mysql database. 

### PC in use:
OS: Xubuntu 16.04.1 LTS
CPU: AMD A10-4655 APU 2.0GHz
RAM: 8.00gb

### Preparations for the project

Before starting to do the actual project I did the necessary preparations as follows:

> $sudo apt-get update

> $sudo apt-get -y upgrade 

## Starting the project

### Instructions

The object of this project is to create my own module for everyday use that is a bit more complex than the previous ones I have written.

### Creating the git module

I decided to start off this project by writing a module that installs git.
First I made a directory for the module called git.

> $mkdir /etc/puppet/modules/git/manifests

Inside that directory I create the init.pp-file.

> $sudoedit init.pp

Into that file I wrote the code that can be found below.
```
class git{
	package{'git':
		ensure => 'installed',
		allowcdrom => 'true',
	}
}
```

After writing that module I tested it.

> $sudo puppet apply -e 'class{'git':}'

I received the following message.
```
Notice: Compiled catalog for xubuntu.pp.htv.fi in enviroment production in 0.25 seconds
Notice: /Stage[main]/Git/Package[git]/ensure: ensure changed 'purged' to 'present'
Notice: Finished catalog run in 4.44 seconds
```
### Creating the Atom module

Next I decided to create a module that installs the Atom editor.
I started with creating a directory for this module as well.

> $mkdir /etc/puppet/modules/extract/manifests

And inside that directory the init.pp-file

> $sudoedit init.pp

The entire module can be seen below. At first the module runs the apt-get update command. After running the update command it downloads the wget package and notifys the Exec['Download Atom'] resource. The Exec resource downloads the atom package using wget to the /tmp/-directory. This part of the module requires the package: wget resource to have run before. The exec also has the timeout attribute for user that have a slower connection. Finally it notifys the Package['extract atom'] resource.
This last part of the module actually installs Atom of the operating system.

```
class extract{
	exec{'apt-get update':
		path => ['/usr/bin'],
	}
	package{'wget':
		ensure => 'installed',
		require => Exec['apt-get update'],
		notify => Exec['Download Atom'],
	}
	exec{'Download Atom':
		command => "/usr/bin/wget https://atom.io/download/deb -O /tmp/atom-amd64.deb",
		require => Package['wget'],
		timeout => 1800,
		notify => Package['extract atom'],
	}
	package{'extract atom':
		provider => dpkg,
		ensure => latest,
		source => "/tmp/atom-amd64.deb",
	}
}
``` 
> $sudo puppet apply -e 'class{'extract':}'

After runnign the module I received the following message:

```
Notice Compiled catalog for xubuntu.pp.htv.fi in enviroment production in 0.28 seconds
Notice: /Stage[main]/Extract/Exec[apt-get update]/returns: executed successfully
Notice: /Stage[main]/Extract/Exec[Download Atom]/returns: executed successfully
Notice: /Stage[main]/Extract/Package[extract atom]/ensure: ensure changed 'purged' to 'latest'
Notice: Finished catalog run in 14.80 seconds
```
