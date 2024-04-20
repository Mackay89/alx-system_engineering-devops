#install puppet-lint version 2.5.0

exec { 'puppet-lint':
	command => '/usr/bin/apt-get -y install puppet-lint',
	unless  => '/usr/bin/dpkg -l | grep puppet-lint | grep -q "2.5.0"',
}

