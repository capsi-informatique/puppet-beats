# @summary Configuration of apache filebeat module
class beats::modules::filebeat::apache (
  Boolean           $enable,
  Boolean           $enable_access,
  Boolean           $enable_error,
  Hash[String, Any] $override = {},
) {
  $final = deep_merge({
      'module' => 'apache',
      'access' => {
        'enable' => $enable_access and $enable,
      },
      'error'  => {
        'enable' => $enable_error and $enable,
      },
  }, $override)
}
