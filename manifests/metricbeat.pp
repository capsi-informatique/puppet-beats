# @summary Install and manage metricbeat service and configuration file
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
#   class { beats::metricbeat:
#     version => '7.17',
#   }
class beats::metricbeat (
  String  $version,
  String  $checksum       = 'auto',
  String  $arch           = $architecture,
  String  $service_ensure = 'running',
  Boolean $service_atboot = true,
) {
  include beats::config::metricbeat

  case $facts['os']['family'] {
    'Debian': { include beats::install::debian::metricbeat }
    default: { err("Class Beats::metricbeat can't manage the OS family named ${facts['os']['family']}") }
  }
}
