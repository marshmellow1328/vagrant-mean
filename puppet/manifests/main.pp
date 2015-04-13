class {'nodejs':
	version				=> 'v0.12.2',
	make_install	=> false
}

package {'grunt-cli':
	ensure		=> '0.1.13',
	provider	=> 'npm',
	require		=> Class['nodejs']
}

exec {'npm-install':
	command	=> '/usr/local/node/node-default/bin/npm install',
	cwd		=> '/vagrant',
	require	=> Class['nodejs']
}


include '::mongodb::server'
