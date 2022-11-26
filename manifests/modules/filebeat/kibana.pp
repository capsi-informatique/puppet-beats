# @summary Configuration of kibana filebeat module
class beats::modules::filebeat::kibana (
  Boolean           $enable,
  Boolean           $enable_log,
  Boolean           $enable_audit,
  Hash[String, Any] $override = {},
) {
  $final = deep_merge({
      'module' => 'kibana',
      'log'    => {
        'enable' => $enable_log and $enable,
      },
      'audit'  => {
        'enable' => $enable_audit and $enable,
      },
  }, $override)
}
