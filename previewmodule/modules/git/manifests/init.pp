class git{
	package{'git':
		ensure => 'installed',
		allowcdrom => 'true',
	}
}
