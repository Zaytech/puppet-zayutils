# == Class: zayutils
#

define zayutils::services::openvpn (
   
   ) {

   package { 'openvpn':
       ensure => installed,
   }


   file {'/etc/openvpn':
      ensure => directory,
      path   => '/etc/openvpn',
      mode   => 655,
      owner  => 'root',
      group  => 'root',
    }

   file {'/etc/openvpn/keys':
      ensure => directory,
      path   => '/etc/openvpn/keys',
      mode   => 655,
      owner  => 'root',
      group  => 'root',
    }

   service { 'openvpn':
      ensure  => running,
      enable  => true,
      hasstatus => false,
      start    => '/etc/init.d/openvpn start',
      stop     => '/etc/init.d/openvpn stop',
      restart  => '/etc/init.d/openvpn restart',
      require => File['/etc/openvpn','/etc/openvpn/keys'] ,
   }

}
