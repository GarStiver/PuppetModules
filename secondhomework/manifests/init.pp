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
