#Script that defines a class for Nginx installation and configuration


exec { "update system":
	command => "/user/bin/apt-get update",
}


package { 'nginx':
	ensure => 'installed',
	require => Exec['update system'],
}


file { '/var/www/html/index.html':
	ensure  => file,
	content => 'Hello World!',
}


file { '/etc/nginx/sites-available/default':
	ensure => present,
	content => template('nginx_redirect/nginx.conf.erb'),
	notify => Service['nginx'],
}


file { '/etc/nginx/sites-enabled/default':
	ensure => link,
	target => '/etc/nginx/sites-available/default',
	require => File['/etc/nginx/sites-available/default'],
}


service { 'nginx':
	ensure => running,
	enable => true,
	require => Package['nginx']
}
