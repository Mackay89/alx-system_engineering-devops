# This increases the amount of traffic an Nginx service can handle.

# Increase the ULIMIT of the default file
exec { 'fix-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => ['/usr/local/:/bin'],
  notify  => Exec['nginx-restart']
}


# Restart Nginx
exec { 'nginx-restart':
  command     => '/etc/init.d/nginx restart',
  path        => ['/bin', '/bin', '/usr/sbin', '/usr/bin'],
  refreshonly => true,
}
