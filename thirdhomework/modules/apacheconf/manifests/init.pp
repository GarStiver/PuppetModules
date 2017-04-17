class apacheconf {
	package{'apache2':
		ensure => 'installed',
	}

	service{'apache2':
		ensure => 'running',
		enable => 'true',
		require => Package['apache2'],
	}
	
	file{'/home/teemu/public_html':
		ensure => 'directory',
		owner => 'teemu',
		group => 'teemu',
	}
	
	file{'/home/teemu/public_html/index.html':
		ensure => 'file',
		content => "Hello World",
		owner => 'teemu',
		group => 'teemu',
	}

	file{'/etc/apache2/sites-available/teemu.conf':
		content => template('apacheconf/teemu.conf.erb'),
		require => Package['apache2'],
		owner => 'root',
		group => 'root',
	}
	
	file{'/etc/apache2/sites-enabled/teemu.conf':
		ensure => 'link',
		target => '/etc/apache2/sites-available/teemu.conf',
		notify => Service['apache2'],
		require => Package['apache2'],
	}
	
	file{'/etc/apache2/sites-enabled/000-default.conf':
		ensure => 'absent',
		notify => Service['apache2'],
		require => Package['apache2'],
	}
}
