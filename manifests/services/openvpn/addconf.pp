# == Class: zayutils
#
define zayutils::services::openvpn::addconf (
  $side = '',
  $confs = '',
  $keyfile = '',

  $template = "zayutils/${side}-openvpn.erb",
  $file = "/etc/openvpn/${name}.conf",
  $file_key_source = "puppet:///${keyfile}",
  $file_key_path   = "/etc/openvpn/keys/${name}.key",
  ) {

  file { $file:
    ensure  => present,
    path => $file,
    owner   => "root",
    group   => "root",
    mode    => "644",
    content => template($template),
    notify  => Service["openvpn"],
    }

  file { $file_key_path:
    ensure  => present,
    source  => $file_key_source,
    path    => $file_key_path,
    owner   => "root",
    group   => "root",
    mode    => "644",
    notify  => Service["openvpn"],
    }

}
