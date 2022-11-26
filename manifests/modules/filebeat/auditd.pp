# @summary Configuration of audits filebeat module
class beats::modules::filebeat::auditd (
  Boolean           $enable,
  Hash[String, Any] $override = {},
) {
  $final = deep_merge({
      'module' => 'auditd',
      'log'    => {
        'enable' => $enable,
      },
  }, $override)
}
