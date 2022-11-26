# @summary Configuration of mysql metricbeat module
class beats::modules::metricbeat::mysql (
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
      'module'  => 'mysql',
      'enabled' => $enable,
      # "metricsets" => [
      #   "status",
      #   "galera_status",
      #   "performance",
      #   "query",
      # ],
      'period'  => '10s',
      'hosts'   => $_hosts,
      #"username" => "root",
      #"password" => "secret",
  }, $override)
}
