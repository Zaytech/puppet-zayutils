# == Class: zayutils
#
# Full description of class zayutils here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'zayutils':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
define zayutils::services::dnsmasq (
   $file = ''
   ) {

   package { 'dnsmasq':
       ensure => installed,
   }

   file { '/etc/dnsmasq.conf':
      ensure  => present,
      path    => "/etc/dnsmasq.conf",
      source  => $file,
      owner   => 'root',
      group   => 'root',
      mode    => 644,
      require => Package['dnsmasq'],
      notify  => Service['dnsmasq'],
   }

   file {'/etc/dnsmasq.d':
      ensure => directory,
      path   => '/etc/dnsmasq.d',
      mode   => 655,
      owner  => 'root',
      group  => 'root',
    }

   service { 'dnsmasq':
      ensure  => running,
      enable  => true,
      require => File['/etc/dnsmasq.conf','/etc/dnsmasq.d'],
   }

}
