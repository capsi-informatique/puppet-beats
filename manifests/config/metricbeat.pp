# @summary Configuration of filebeat
class beats::config::metricbeat (
  Optional[Hash[String, Any]] $output_elasticsearch,
  Optional[Hash[String, Any]] $output_logstash,
  Array[Hash[String, Any]]    $processors,
  Hash[String, Any]           $override_config_setup = {},
  Hash[String, Any]           $override              = {},
) {
  require beats::modules::metricbeat::apache
  require beats::modules::metricbeat::beat
  require beats::modules::metricbeat::docker
  require beats::modules::metricbeat::elasticsearch
  require beats::modules::metricbeat::kibana
  require beats::modules::metricbeat::linux
  require beats::modules::metricbeat::mongodb
  require beats::modules::metricbeat::mysql
  require beats::modules::metricbeat::nginx
  require beats::modules::metricbeat::system

  $config_setup = deep_merge({
      'template'   => {
        'settings' => {
          'index' => {
            'number_of_shards' => 1,
            'codec'            => 'best_compression',
          },
          # "_source" => {
          #   "enabled" => false,
          # },
        },
      },
      'dashboards' => {
        # "enabled" => false,
        # "url" => undef,
      },
      'kibana'     => {
        # "host" => "localhost:5601",
        # "space" => {
        #   "id" => undef,
        # },
      },
  }, $override_config_setup)

  if $output_elasticsearch and $output_logstash {
    fail('Only one output must be configured, please choose between logstach and elasticsearch')
  } elsif $output_elasticsearch {
    $output = {
      'elasticsearch' => $output_elasticsearch,
    }
  } elsif $output_logstash {
    $output = {
      'logstash' => $output_logstash,
    }
  } else {
    fail('No output was set, please set one output between logstach and elasticsearch')
  }

  $final = deep_merge({
      'metricbeat' => {
        'modules' => [
          $beats::modules::metricbeat::apache::final,
          $beats::modules::metricbeat::beat::final,
          $beats::modules::metricbeat::docker::final,
          $beats::modules::metricbeat::elasticsearch::final,
          $beats::modules::metricbeat::kibana::final,
          $beats::modules::metricbeat::linux::final,
          $beats::modules::metricbeat::mongodb::final,
          $beats::modules::metricbeat::mysql::final,
          $beats::modules::metricbeat::nginx::final,
          $beats::modules::metricbeat::system::final_base,
          $beats::modules::metricbeat::system::final_fs,
          $beats::modules::metricbeat::system::final_uptime,
        ],
      },
      'setup'      => $config_setup,
      'name'       => $facts['networking']['hostname'],
      # "tags" => ["service-X", "web-tier"],
      # "fields" => {
      #   "env" => "staging",
      # },
      # "cloud" => {
      #   "id" => undef,
      #   "auth" => undef,
      # },
      'output'     => $output,
      'processors' => $processors,
      # "logging" => {
      #   "level" => "debug",
      #   "selectors" => ["*"],
      # },
      # "monitoring" => {
      #   "enabled" => false,
      #   "cluster_uuid" => undef,
      #   "elasticsearch" => undef,
      # },
      # "instrumentation" => {
      #   "enabled" => false,
      #   "environment" => "",
      #   "hosts" => ["http://localhost:8200"],
      #   "api_key" => undef,
      #   "secret_token" => undef,
      # }
      # "migration" => { "6_to_7" => { "enabled" => true } }
  }, $override)
}
