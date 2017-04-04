class package {
	package { 'vlc':
		ensure => 'installed',
	}
	file { '/tmp/helloWorld':
		content => "See you at kruteleff.com!\n"
	}
}
