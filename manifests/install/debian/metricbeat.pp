# @summary Install and manage metricbeat service and configuration file on Debian
# @api private
class beats::install::debian::metricbeat {
  assert_private("Use of private class ${name} by ${caller_module_name}")

  include beats::metricbeat
  include beats::config::metricbeat
  require beats::install::debian::remove_repo

  $uri = "https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-${beats::metricbeat::version}-${
  beats::metricbeat::arch}.deb"
  $deb = "/var/cache/apt/archives/metricbeat+puppet_${beats::metricbeat::arch}.deb"

  if $beats::metricbeat::checksum == 'auto' {
    $_checksum = beats::get_checksum($uri, 'metricbeat', $beats::metricbeat::version)
  } else {
    $_checksum = $beats::metricbeat::checksum
  }

  file { $deb:
    ensure         => 'file',
    source         => $uri,
    checksum       => 'sha512',
    checksum_value => $_checksum,
    owner          => 'root',
    group          => 'root',
    mode           => '0500',
  }

  package { 'metricbeat':
    ensure   => 'latest',
    provider => 'dpkg',
    source   => $deb,
    require  => File[$deb],
  }

  file { '/etc/metricbeat/metricbeat.yml':
    ensure  => 'file',
    content => to_yaml($beats::config::metricbeat::final),
    require => [
      Package['metricbeat'],
      Service['metricbeat.service'],
    ],
  }

  service { 'metricbeat.service':
    ensure  => $beats::metricbeat::service_ensure,
    enable  => $beats::metricbeat::service_atboot,
    require => [
      Package['metricbeat'],
    ],
  }
}
