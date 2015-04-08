# == Class: zayutils::accounts:addkeys

define zayutils::account::addkey ( $key ) {
  ssh_authorized_key { $name: 
    ensure => present,
    type   => $key[0],
    user   => $key[1],  
    name   => $key[2],
    key    => $key[3], 
  }

}
