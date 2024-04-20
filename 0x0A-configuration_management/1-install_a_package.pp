#install puppet-lint version 2.5.0

exec { 'puppet-lint':
	command => '/usr/bin/apt-get -y install puppet-lint -v2.5.0',
}

