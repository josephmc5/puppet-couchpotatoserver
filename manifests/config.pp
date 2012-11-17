class couchpotatoserver::config {
    file { "$base_dir/couchpotato/config/":
        ensure => directory,
        owner => 'couchpotato',
        group => 'couchpotato',
    }
    file { "$base_dir/couchpotato/settings.conf":
        content => template('couchpotatoserver/settings.conf.erb'),
        owner => 'couchpotato',
        group => 'couchpotato',
        mode => '0644',
        require => File["$base_dir/couchpotato/config/"],
        notify => Service['supervisor::couchpotato'],
    }
    
    file { "$log_dir":
        ensure => directory,
        owner => 'couchpotato',
        group => 'couchpotato',
        mode => '0644',
    }
}
