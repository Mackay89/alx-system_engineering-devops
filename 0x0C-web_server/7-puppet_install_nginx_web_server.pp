#Install Nginx package
package { 'nginx':
  ensure => installed,
}


file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => template('nginx/default.erb'),
  notify  => Service['nginx'],
}


service { 'nginx':
  ensure => running,
  enable => true,
}

File['/etc/nginx/sites-available/default'] ~> Service['nginx']


exec { 'check_nginx_root':
  command	=> 'curl -s http://localhost/ | grep "Hello World!"',
  unless	=> 'curl -s http://localhost/ | grep -q "Hello World"',
  subscribe	=> File['/etc/nginx/sites-available/default'],
}

file_line { 'add_301_redirection':
  path	 => '/etc/nginx/sites-available/default',
  line	 => '	rewrite ^/redirect_me https://github.com/luischaparroc permanent;',
  match  => '^.*rewrite ^/redirect_me.*$',
  notify => Service['nginx'],
  require => Package['nginx'],
}


File['/etc/nginx/sites-available/default'] ~> Service['nginx']
