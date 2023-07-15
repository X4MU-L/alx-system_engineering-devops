# Configures a new server.

# update machine
exec { 'Update':
  provider => 'shell',
  command  => 'apt update -y',
}

# install Nginx
-> package { 'Nginx':
  ensure   => installed,
  name     => 'nginx',
  provider => 'apt',
}

# create index.html page
-> exec { '/var/www/html/index.html':
  provider => 'shell',
  command  => 'echo "Hello World!" | tee /var/www/html/index.html > /dev/null 2>&1',
}

# configure nginx with a new server block
-> exec { 'server block config':
  provider => 'shell',
  command  => 'printf %s  "server {
  listen 80 default_server;
  listen [::]:80 default_server;

  root /var/www/html;
  index index.html index.htm;

  location /redirect_me {
  	   return 301 https://www.google.com;
  }

  location / {
           try_files \$uri \$uri/ =404;
  }
  add_header X-Served-By $(hostname);
}" > /etc/nginx/sites-available/default',
}

# restart web server
-> exec { 'restart':
  command => '/etc/init.d/nginx restart',
}