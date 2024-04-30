#Update package respositories
exec {'update':
  command => '/usr/bin/apt-get update',
}


#Install Nginx package
package {'nginx':
  ensure => 'present',
}

Facter.add('nginx_hostname') do
  setcode do 
    Facter::Core::Execution.execute('hostname')
  end
end


file_line { 'http_header':
  path   => '/etc/nginx/nginx.conf',
  line   => " add_header X-Served-By \"${facts['nginx_hostname']}\";",
  match  => 'http {',
  notify => Exec['nginx_restart'],
}


# Restart Nginx service
exec {'nginx_restart':
  command => '/usr/sbin/service nginx restart',
}
