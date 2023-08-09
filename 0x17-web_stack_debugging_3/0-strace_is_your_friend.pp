# update machine
exec { 'Update':
  provider => 'shell',
  command  => 'apt update -y',
}

# stop apache2 server
-> exec { 'stop apache':
  command => '/etc/init.d/apache2 stop',
}

# change trailing p
-> exec { 'change train p in file':
  provider => 'shell',
  command  => "sed -i 's.phpp.php.g' /var/www/html/wp-settings.php"
}

# restart apache2 server
-> exec { 'restart apache':
  command => '/etc/init.d/apache2 restart',
}