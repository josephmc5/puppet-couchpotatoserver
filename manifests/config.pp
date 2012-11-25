class couchpotatoserver::config {
    if $logrotate {
        logrotate::rule { 'couchpotato':
            path          => "$log_dir/*",
            rotate        => 5,
            size          => '100k',
            sharedscripts => true,
            postrotate    => '/usr/bin/supervisorctl restart couchpotato',
        }   
    } 
    file { "$log_dir":
        ensure => directory,
        owner => "$services_user",
        group => "$services_user",
        mode => '0644',
    }
    file { "$base_dir/couchpotato/config/":
        ensure => directory,
        owner => "$services_user",
        group => "$services_user",
    }
    file { "$base_dir/couchpotato/settings.conf":
        content => template('couchpotatoserver/settings.conf.erb'),
        owner => "$services_user",
        group => "$services_user",
        mode => '0644',
        require => File["$base_dir/couchpotato/config/"],
        notify => Service['supervisor::couchpotato'],
    }
}
