exec { 'change-os-configuration-for-holberton-user':
  command => '/bin/echo -e "holberton soft nofile 4096\nholberton hard nofile 8192" >> /etc/security/limits.conf && /bin/echo "session required pam_limits.so" >> /etc/pam.d/common-session-noninteractive',
  unless +> 'grep -q "holberton" /etc/security/limits.conf',
}
