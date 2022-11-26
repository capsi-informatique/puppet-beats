# @summary Configuration of docker metricbeat module
class beats::modules::metricbeat::docker (
  Boolean           $enable,
  Array[String]     $hosts,
  Hash[String, Any] $override = {},
) {
  if $hosts =~ String {
    $_hosts = [$hosts]
  } else {
    $_hosts = $hosts
  }

  $final = deep_merge({
      'module'  => 'docker',
      'enabled' => $enable,
      # "metricsets" => [
      #   "container",
      #   "cpu",
      #   "diskio",
      #   "event",
      #   "healthcheck",
      #   "info",
      #   "memory",
      #   "network",
      # ],
      'period'  => '10s',
      'hosts'   => $_hosts,
      # "labels" => { "dedot" => false, },
      # "ssl" => {
      #   "certificate_authority" => "/etc/pki/root/ca.pem",
      #   "certificate"           => "/etc/pki/client/cert.pem",
      #   "key"                   => "/etc/pki/client/cert.key",
      # }
  }, $override)
}
