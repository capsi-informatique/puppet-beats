# @summary Configuration of postgresql filebeat module
class beats::modules::filebeat::postgresql (
  Boolean           $enable,
  Hash[String, Any] $override = {},
) {
  $final = deep_merge({
      'module' => 'postgresql',
      'log'    => {
        'enable' => $enable,
      },
  }, $override)
}
