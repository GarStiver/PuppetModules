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
