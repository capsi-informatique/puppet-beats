# @summary Configuration of mysql filebeat module
class beats::modules::filebeat::mysql (
  Boolean           $enable,
  Boolean           $enable_error,
  Boolean           $enable_slowlog,
  Hash[String, Any] $override = {},
) {
  $final = deep_merge({
      'module'  => 'mysql',
      'error'   => {
        'enable' => $enable_error and $enable,
      },
      'slowlog' => {
        'enable' => $enable_slowlog and $enable,
      },
  }, $override)
}
