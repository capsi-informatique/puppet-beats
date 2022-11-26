# @summary Configuration of haproxy eilebeat module
class beats::modules::filebeat::haproxy (
  Boolean           $enable,
  Hash[String, Any] $override = {},
) {
  $final = deep_merge({
      'module' => 'haproxy',
      'log'    => {
        'enable' => $enable,
      },
  }, $override)
}
