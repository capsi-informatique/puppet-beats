# @summary Configuration of nginx filebeat module
class beats::modules::filebeat::nginx (
  Boolean           $enable,
  Boolean           $enable_access,
  Boolean           $enable_error,
  Boolean           $enable_ingress_controller,
  Hash[String, Any] $override = {},
) {
  $final = deep_merge({
      'module'             => 'nginx',
      'access'             => {
        'enable' => $enable_access and $enable,
      },
      'error'              => {
        'enable' => $enable_error and $enable,
      },
      'ingress_controller' => {
        'enable' => $enable_ingress_controller and $enable,
      },
  }, $override)
}
