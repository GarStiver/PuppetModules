class ssh {	
	package {"openssh-server":
		ensure => "installed",
	}
	
	service {"sshd":
		ensure => "running",
		enable => "true",
		require => Package["openssh-server"],
	}
	
	file {"/etc/ssh/sshd_config":
		content => template('ssh/sshd_config.erb'),
		require => Package["openssh-server"],
		notify => Service["sshd"],
	}
}
