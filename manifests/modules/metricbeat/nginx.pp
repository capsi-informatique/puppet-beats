# @summary Configuration of nginx metricbeat module
class beats::modules::metricbeat::nginx (
  Boolean           $enable,
  Array[String]     $hosts,
  String            $status_path,
  Hash[String, Any] $override = {},
) {
  if $hosts =~ String {
    $_hosts = [$hosts]
  } else {
    $_hosts = $hosts
  }

  $final = deep_merge({
      'module'             => 'nginx',
      'enabled'            => $enable,
      'metricsets'         => ['stubstatus'],
      'period'             => '10s',
      'hosts'              => $_hosts,
      'server_status_path' => $status_path,
      #"username" => "user",
      #"password" => "secret",
  }, $override)
}
