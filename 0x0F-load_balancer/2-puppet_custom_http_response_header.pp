#Update package respositories
exec {'update':
  command => '/usr/bin/apt-get update',
}
#Install Nginx package
package {'nginx':
  ensure => 'installed',
}
# add custom fact for Nginx hostname
Facter::Core::facts::nginx_hostname {'nginx_hostname': }
# Ensure Nginx configuration has custom HTTP header
file_line { 'http_header':
  path   => '/etc/nginx/nginx.conf',
  line   => " add_header X-Served-By \"${facts['nginx_hostname']}\";",
  match  => 'http {',
  notify => Service['nginx'],
}
# Restart Nginx service
exec {'nginx_restart':
  command => '/usr/bin/service nginx restart',
}
