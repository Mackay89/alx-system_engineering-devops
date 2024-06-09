# This Puppet manifest fixes atypo in wp-settings.php to resolve a 500 error on Apache2

exec { 'fix_typo':
  path     => ['/usr/sbin', '/usr/bin', '/sbin', '/bin'],
  command  =>  "sed -i 's/.phpp/.php/g' /var/www/html/wp-settings.php",
  provider => 'shell',
}
