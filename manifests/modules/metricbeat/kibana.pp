# @summary Configuration of kibana metricbeat module
class beats::modules::metricbeat::kibana (
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
      'module'  => 'kibana',
      'enabled' => $enable,
      # "metricsets" => [
      #   "status",
      # ],
      'period'  => '10s',
      'hosts'   => $_hosts,
      #"basepath" => "",
      #"username" => "user",
      #"password" => "secret",
  }, $override)
}
