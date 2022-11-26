# @summary Configuration of iptables filebeat module
class beats::modules::filebeat::iptables (
  Boolean           $enable,
  Hash[String, Any] $override = {},
) {
  $final = deep_merge({
      'module' => 'iptables',
      'log'    => {
        'enable' => $enable,
      },
  }, $override)
}
