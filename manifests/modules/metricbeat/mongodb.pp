# @summary Configuration of mongodb metricbeat module
class beats::modules::metricbeat::mongodb (
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
      'module'  => 'mongodb',
      'enabled' => $enable,
      # "metricsets" => [
      #   "dbstats",
      #   "status",
      #   "collstats",
      #   "metrics",
      #   "replstatus",
      # ],
      'period'  => '10s',
      'hosts'   => $_hosts,
      # "ssl" => {
      #   "enabled"                 => true,
      #   "verification_mode"       => "full",
      #   "certificate_authorities" => [ "/etc/pki/root/ca.pem", ],
      #   "certificate"             => "/etc/pki/client/cert.pem",
      #   "key"                     => "/etc/pki/client/cert.key",
      # },
      #"username" => "user",
      #"password" => "pass",
  }, $override)
}
