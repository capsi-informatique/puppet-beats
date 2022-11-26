# @summary Install and manage filebeat service and configuration file on Debian
# @api private
class beats::install::debian::filebeat {
  assert_private("Use of private class ${name} by ${caller_module_name}")

  include beats::filebeat
  include beats::config::filebeat
  require beats::install::debian::remove_repo

  $uri = "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${beats::filebeat::version}-${
  beats::filebeat::arch}.deb"
  $deb = "/var/cache/apt/archives/filebeat+puppet_${beats::filebeat::arch}.deb"

  if $beats::filebeat::checksum == 'auto' {
    $_checksum = beats::get_checksum($uri, 'filebeat', $beats::filebeat::version)
  } else {
    $_checksum = $beats::filebeat::checksum
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

  package { 'filebeat':
    ensure   => 'latest',
    provider => 'dpkg',
    source   => $deb,
    require  => File[$deb],
  }

  file { '/etc/filebeat/filebeat.yml':
    ensure  => 'file',
    content => to_yaml($beats::config::filebeat::final),
    require => [
      Package['filebeat'],
      Service['filebeat.service'],
    ],
  }

  service { 'filebeat.service':
    ensure  => $beats::filebeat::service_ensure,
    enable  => $beats::filebeat::service_atboot,
    require => [
      Package['filebeat'],
    ],
  }
}
