# @summary Configuration of filebeat
class beats::config::filebeat (
  Boolean                     $enable_input_log,
  Boolean                     $enable_input_filestream,
  Array[String]               $paths_input_log,
  Array[String]               $paths_input_filestream,
  Optional[Hash[String, Any]] $output_elasticsearch,
  Optional[Hash[String, Any]] $output_logstash,
  Array[Hash[String, Any]]    $processors,
  Hash[String, Any]           $override_input_log        = {},
  Hash[String, Any]           $override_input_filestream = {},
  Hash[String, Any]           $override_config_setup     = {},
  Hash[String, Any]           $override                  = {},
) {
  assert_private("Use of private class ${name} by ${caller_module_name}")

  require beats::modules::filebeat::apache
  require beats::modules::filebeat::auditd
  require beats::modules::filebeat::elasticsearch
  require beats::modules::filebeat::haproxy
  require beats::modules::filebeat::iptables
  require beats::modules::filebeat::kibana
  require beats::modules::filebeat::mysql
  require beats::modules::filebeat::nginx
  require beats::modules::filebeat::postgresql
  require beats::modules::filebeat::system

  $config_input_log = deep_merge({
      'type'    => 'log',
      'enabled' => $enable_input_log,
      'paths'   => $paths_input_log,
      # "exclude_lines" => ['^DBG'],
      # "include_lines" => ['^ERR', '^WARN'],
      # "exclude_files" => ['.gz$'],
      # "fields" => {
      #   "level" => "debug",
      #   "review" => 1,
      # },
      # "multiline" => {
      #   "pattern" => "^\[",
      #   "negate" => false,
      #   "match" => "after",
      # },
  }, $override_input_log)

  $config_input_filestream = deep_merge({
      'type'    => 'filestream',
      'enabled' => $enable_input_filestream,
      'paths'   => $paths_input_filestream,
      # "exclude_lines" => ['^DBG'],
      # "include_lines" => ['^ERR', '^WARN'],
      # "prospector" => {
      #   "scanner" => {
      #     "exclude_files" => ['.gz$'],
      #   },
      # },
      # "fields" => {
      #   "level" => "debug",
      #   "review" => 1,
      # },
  }, $override_input_filestream)

  $config_setup = deep_merge({
      'template'   => {
        'settings' => {
          'index' => {
            'number_of_shards' => 1,
            # "codec" => "best_compression",
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
      'filebeat'   => {
        'inputs'  => [
          $config_input_log,
          $config_input_filestream,
        ],
        'modules' => [
          $beats::modules::filebeat::apache::final,
          $beats::modules::filebeat::auditd::final,
          $beats::modules::filebeat::elasticsearch::final,
          $beats::modules::filebeat::haproxy::final,
          $beats::modules::filebeat::iptables::final,
          $beats::modules::filebeat::kibana::final,
          $beats::modules::filebeat::mysql::final,
          $beats::modules::filebeat::nginx::final,
          $beats::modules::filebeat::postgresql::final,
          $beats::modules::filebeat::system::final,
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
