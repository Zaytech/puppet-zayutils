# == Class: zayutils
#
define zayutils::network (
  $interfaces = '',
  $template = 'zayutils/interfaces.erb',
  $file = "/etc/network/interfaces",
# $file = "/tmp/teste",
  ) {

  service { 'networking':
    ensure => running,
    start => '/etc/init.d/networking start',
    stop => '/etc/init.d/networking stop',
    restart => '/etc/init.d/networking restart',
    hasstatus => false,
  }


  file { $file:
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => "644",
    content => template($template),
    notify  => Service["networking"],
    }



  }



