# automate task 0 with  Puppet

##Update package repositories
exec {'update':
  command => '/usr/bin/apt-get update',
}

#Install Nginx package
-> package {'nginx':
  ensure => 'installed',
}

# add custom fact for Nginx hostname
-> facter::Core::Facts::Nginx_hostname {'nginx_hostname': }

# Ensure Nginx configuration has custom HTTP header
-> file_line { 'http_header':
  path   => '/etc/nginx/nginx.conf',
  line   => " add_header X-Served-By \"${facts['nginx_hostname']}\";",
  match  => 'http {',
  notify => Service['nginx'],
}

# Restart Nginx service
-> service {'run':
  command => '/usr/sbin/service nginx restart',
}
