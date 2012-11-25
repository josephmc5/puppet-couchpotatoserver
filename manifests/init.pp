class couchpotatoserver inherits couchpotatoserver::params {
	include couchpotatoserver::config
    include couchpotatoserver::proxy
    include git
    include python::virtualenv
    include supervisor
	
#	user { "$services_user":
#        allowdupe => false,
#        ensure => 'present',
#    }

    file { "$base_dir/couchpotato":
        ensure => directory,
        owner => "$services_user",
        group => "$services_user",
        mode => '0644',
    }
    exec { 'venv-create-couchpotato':
        command => "virtualenv $venv_dir",
        cwd => "$base_dir/couchpotato",
        creates => "$base_dir/couchpotato/$venv_dir/bin/activate",
        path => '/usr/bin/',
        require => Class['python::virtualenv'];
    }
    exec { 'download-couchpotato':
        command => "/usr/bin/git clone $url src",
        cwd     => "$base_dir/couchpotato",
        creates => "$base_dir/couchpotato/src",
        require => Class['git'],
    }
    supervisor::service {
        'couchpotato':
            ensure => present,
            enable => true,
            stdout_logfile => "$base_dir/couchpotato/log/supervisor.log",
            stderr_logfile => "$base_dir/couchpotato/log/supervisor.log",
            command => "$base_dir/couchpotato/venv/bin/python $base_dir/couchpotato/src/CouchPotato.py --data_dir $base_dir/couchpotato/",
            user => "$services_user",
            group => "$services_user",
            directory => "$base_dir/couchpotato/src/",
            require => Exec['download-couchpotato'],
    }
}
