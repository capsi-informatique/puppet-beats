# @summary Configuration of linux metricbeat module
class beats::modules::metricbeat::linux (
  Boolean           $enable,
  Array[String]     $metrics,
  Hash[String, Any] $override = {},
) {
  $final = deep_merge({
      'module'     => 'linux',
      'enabled'    => $enable,
      'metricsets' => $metrics,
      'period'     => '10s',
      #"hostfs" => "/hostfs",
  }, $override)
}
