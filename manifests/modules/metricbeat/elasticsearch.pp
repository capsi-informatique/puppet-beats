# @summary Configuration of elasticsearch metricbeat module
class beats::modules::metricbeat::elasticsearch (
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
      'module'  => 'elasticsearch',
      'enabled' => $enable,
      # "metricsets" => [
      #   "node",
      #   "node_stats",
      # ],
      'period'  => '10s',
      'hosts'   => $_hosts,
      #"username" => "user",
      #"password" => "secret",
  }, $override)
}
