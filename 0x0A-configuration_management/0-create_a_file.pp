# create a file scholl in the /tmp folder
file { 'school':
  path    => '/tmp/school'
  ensure  => 'present'
  mode    => '0744'
  owner   => 'www-data'
  group   => 'www-data'
  content => 'I love Puppet'
}