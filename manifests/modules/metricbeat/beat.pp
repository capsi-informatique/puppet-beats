# @summary Configuration of beat metricbeat module
class beats::modules::metricbeat::beat (
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
      'module'     => 'beat',
      'enabled'    => $enable,
      'metricsets' => [
        'stats',
        'state',
      ],
      'period'     => '10s',
      'hosts'      => $_hosts,
  }, $override)
}
