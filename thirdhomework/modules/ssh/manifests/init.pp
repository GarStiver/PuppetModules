class ssh {	
	package {"openssh-server":
		ensure => "installed",
	}
	
	service {"sshd":
		ensure => "running",
		enable => "true",
		require => Package["ssh"],
	}
	
	file {"/etc/ssh/sshd_config":
		content => template('sshd/sshd_config.erb'),
		require => Package["ssh"],
		notify => Service["sshd"],
	}
}
