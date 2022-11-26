# @summary Configuration of system filebeat module
class beats::modules::filebeat::system (
  Boolean           $enable,
  Boolean           $enable_syslog,
  Boolean           $enable_auth,
  Hash[String, Any] $override = {},
) {
  $final = deep_merge({
      'module' => 'system',
      'syslog' => {
        'enable' => $enable_syslog and $enable,
      },
      'auth'   => {
        'enable' => $enable_auth and $enable,
      },
  }, $override)
}
