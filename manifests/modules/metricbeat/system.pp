# @summary Configuration of system metricbeat module
class beats::modules::metricbeat::system (
  Boolean           $enable,
  Array[String]     $metrics_base,
  Hash[String, Any] $override_base   = {},
  Hash[String, Any] $override_fs     = {},
  Hash[String, Any] $override_uptime = {},
) {

  $final_base = deep_merge({
      'module'     => 'system',
      'enabled'    => $enable,
      'metricsets' => $metrics_base,
      'period'     => '10s',
      'process'    => { 'include_top_n' => {
          'by_cpu'    => 5,
          'by_memory' => 5,
      }, },
      #"hostfs" => "/hostfs",
  }, $override_base)

  $final_fs = deep_merge({
      'module'     => 'system',
      'enabled'    => $enable,
      'metricsets' => [
        'filesystem',
        'fsstat',
      ],
      'period'     => '1m',
      'processors' => [
        {
          'drop_event.when.regexp' => {
            'system.filesystem.mount_point' => '^/(sys|cgroup|proc|dev|etc|host|lib|snap)($|/)',
          },
        },
      ],
  }, $override_fs)

  $final_uptime = deep_merge({
      'module'     => 'system',
      'enabled'    => $enable,
      'metricsets' => [
        'uptime',
      ],
      'period'     => '15m',
  }, $override_uptime)
}
