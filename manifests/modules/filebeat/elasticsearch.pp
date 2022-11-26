# @summary Configuration of elasticsearch filebeat module
class beats::modules::filebeat::elasticsearch (
  Boolean           $enable,
  Boolean           $enable_server,
  Boolean           $enable_gc,
  Boolean           $enable_audit,
  Boolean           $enable_slowlog,
  Boolean           $enable_deprecation,
  Hash[String, Any] $override = {},
) {
  $final = deep_merge({
      'module'      => 'elasticsearch',
      'server'      => {
        'enable' => $enable_server and $enable,
      },
      'gc'          => {
        'enable' => $enable_gc and $enable,
      },
      'audit'       => {
        'enable' => $enable_audit and $enable,
      },
      'slowlog'     => {
        'enable' => $enable_slowlog and $enable,
      },
      'deprecation' => {
        'enable' => $enable_deprecation and $enable,
      },
  }, $override)
}
