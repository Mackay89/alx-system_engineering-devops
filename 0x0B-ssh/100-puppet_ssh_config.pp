#!/usr/bin/env bash
#Using puppet to connect without password


file { '/etc/ssh/ssh_config':
	ensure => present,
}


file_line { 'Turn off password auth':
  path    => '/etc/ssh/ssh_config',
  line    => '	passwordAuthentication no',
  replace => true,
}


file_line { 'Declare identity file ':
  path   => '/etc/ssh/ssh_config',
  line   => 'IdentityFile ~/.ssh/school',
  replace  => true
