# kill a process name killmenow
exec { 'pkill -f killmenow':
  command => '/bin/pkill -f killmenow'
}