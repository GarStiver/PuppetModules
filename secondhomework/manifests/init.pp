class apacheconf {
	package {'apache2':
		ensure => 'installed',
	}
	file {'/var/www/html/index.html':
		content => "Life is more than a simple series of ones and zeroes",
	}
	service {'apache2':
		ensure => 'running',
	}
}
