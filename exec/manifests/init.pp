class exec {
	exec {'date':
		command => '/bin/date >/tmp/output.txt',
	}
}
