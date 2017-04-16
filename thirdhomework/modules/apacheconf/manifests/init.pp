class apacheconf {
	package {'apache2':
		ensure => 'installed',
	}

	file {'/home/teemu/publicsite/':
		ensure => 'directory',
	}

	file {'/home/teemu/publicsite/index.html':
		ensure => 'file',
		content => "Life is more than a simple series of ones and zeroes",
		before => Service ['apache2'],
	}
	
	file {'/home/etc/apache2/sites-available/teemu.conf':
		content => template('apacheconf/teemu.conf'),
		require => Package['apache2'],
	}
	
	file {'/home/etc/apache2/sites-enabled/teemu.conf':
		ensure => 'link',
		target => '/home/etc/apache2/sites-available/teemu.conf',
		require => Package['apache2'],
	}

	service {'apache2':
		ensure => 'running',
		enable => 'true',
		require => Package['apache2'],
	}
}
