class mysql {
	package{"mysql-server":
		ensure => "installed",
		allowcdrom => "true",
	}
	service {"mysql":
		ensure => "running",
		enable => "true",
		require => Package["mysql-server"],
	}
	exec {"mysqlpasswd":
		command => "/usr/bin/mysqladmin -u root password NewPassword",
		notify => [Service["mysql"]],
		require => [Package["mysql-server"]],
	}
}
