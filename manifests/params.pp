class couchpotatoserver::params (
    $api_key = hiera("couchpotato_api_key"),
    $couchpotato_host = hiera("couchpotato_host", "localhost"),
    $couchpotato_port = hiera("couchpotato_port", "5000"),
    $couchpotato_webroot = hiera("couchpotato_webroot", "/movies"),
    $sabnzbd_api_key = hiera("sabnzbd_nzb_key"),
    $ssl = hiera("couchpotato_ssl", "0"),
    $nzb_server_ssl = hiera("nzb_server_ssl", "1"),
    $nzbmatrix_username = hiera("nzbmatrix_username", ""),
    $nzbmatrix_apikey = hiera("nzbmatrix_apikey", ""),
    $base_dir = hiera("app_dir", "/opt"),
    $sabnzbd_host = hiera("sabnzbd_host", "localhost"),
    $sabnzbd_port = hiera("sabnzbd_port", "8080"),
    $sabnzbd_webroot = hiera("sabnzbd_webroot", "/sabnzbd"),
    $complete_dir = hiera("complete_download_dir"),
    $downloads_dir = hiera("incomplete_download_dir"),
    $complete_movie_download_dir = hiera("complete_movie_download_dir", "moveies"),
    $complete_tv_download_dir = hiera("complete_tv_download_dir", "tv"),
    $complete_music_download_dir = hiera("complete_music_download_dir", "music"),
    $external_dns = hiera("external_dns", "localhost"),
    $venv_dir = "venv",
    $url = hiera("couchpotato_git_url", "git://github.com/RuudBurger/CouchPotatoServer.git"),
    $proxy_nginx = hiera("proxy_nginx", "false"),
    $proxy_apache = hiera("proxy_apache", "false"),
    $logrotate = hiera("logrotate", "false"),
)
{
    $services_user = hiera("services_user")
    $log_dir = "$base_dir/couchpotato/log"
    $data_dir = "$base_dir/couchpotato/data"
    $cache_dir = "$base_dir/couchpotato/cache"
}
