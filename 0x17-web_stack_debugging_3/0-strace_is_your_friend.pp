#Using strace and then using Puppet to automate fix for 500 error on Apache2 
exec { 'fix_typo':
  path	   => ['/usr/bin', '/bin', '/bin', '/usr/bin'],
  command  =>  "sed -i 's/.phpp/.php/g' /var/www/html/wp-settings.php",
  provider => 'shell',
}
