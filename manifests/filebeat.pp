# @summary Install and manage filebeat service and configuration file
#
# @param version
#   The version of the beat to install
#
# @param checksum
#   The SHA-512 checksum of the Debian package or "auto"
#
# @param arch
#   The architecture of the beat to download
#
# @example
#   class { beats::filebeat:
#     version => '7.17',
#   }
class beats::filebeat (
  String  $version,
  String  $checksum       = 'auto',
  String  $arch           = $facts['os']['architecture'],
  String  $service_ensure = 'running',
  Boolean $service_atboot = true,
) {
  include beats::config::filebeat

  case $facts['os']['family'] {
    'Debian': { include beats::install::debian::filebeat }
    default: { err("Class Beats::Filebeat can't manage the OS family named ${facts['os']['family']}") }
  }
}
