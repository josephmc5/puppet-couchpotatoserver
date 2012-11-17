class couchpotatoserver::proxy inherits couchpotatoserver::params {
    if $proxy_nginx {
        include nginx
        nginx::resource::upstream { 'couchpotato':
            ensure  => present,
            members => "$couchpotato_host:$couchpotato_port",
        }
        nginx::resource::location { 'couchpotato':
            ensure   => present,
            proxy  => 'http://couchpotato',
            location => "$couchpotato_webroot",
            vhost    => "$external_dns",
        }
    }
}
