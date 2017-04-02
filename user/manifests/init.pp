class user {
	user {'hippi':
		ensure => 'present',
		home => '/sbin',
		password => 'Seteli11!',
		groups => ['bin', 'adm', 'lp'],
		comment => 'hippi'
	}
}
