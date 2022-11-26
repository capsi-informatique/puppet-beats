# @summary Configuration of apache metricbeat module
class beats::modules::metricbeat::apache (
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
      'module'  => 'apache',
      'enabled' => $enable,
      #"metricsets" => ["status"],
      'period'  => '10s',
      'hosts'   => $_hosts,
      #"username" => "user",
      #"password" => "secret",
  }, $override)
}
