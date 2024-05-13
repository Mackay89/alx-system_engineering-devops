#Install Nginx package
package { 'nginx':
  ensure => installed,
}

#Confgure Nginx to listen on port 80
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => template('nginx/default.erb'),
  notify  => Service['nginx'],
}


#Ensure Nginx service is running
service { 'nginx':
  ensure => running,
  enable => true,
}


#Ensure Nginx is restarted when  configuration changes
File['/etc/nginx/sites-available/default'] ~> Service['nginx']

#Check if Nginx root page returns "Hello World!"
exec { 'check_nginx_root':
  command   => 'curl -s http://localhost/ | grep "Hello World!"',
  unless    => 'curl -s http://localhost/ | grep -q "Hello World"',
  subscribe => File['/etc/nginx/sites-available/default'],
}


#Add 301 redirection rule for /redirect_me
file_line { 'add_301_redirection':
  path	  => '/etc/nginx/sites-available/default',
  line	  => '	rewrite ^/redirect_me https://github.com/luischaparroc permanent;',
  match   => '^.*rewrite ^/redirect_me.*$',
  notify  => Service['nginx'],
  require => Package['nginx'],
}

#Ensure Nginx is restarted when 301 redirection rule changes
File['/etc/nginx/sites-available/default'] ~> Service['nginx']
