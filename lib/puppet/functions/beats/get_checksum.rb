# frozen_string_literal: true

# Based on https://github.com/voxpupuli/puppet-extlib/blob/v6.0.0/lib/puppet/functions/extlib/cache_data.rb
# Licenced under Apache License 2.0

require 'fileutils'
require 'yaml'
require 'etc'

# @summary Retrieves beat SHA-512 Hash from a cache file, or get it from artifacts.elastic.co
#
# @example
#   $checksum = get_checksum($url)
Puppet::Functions.create_function(:"beats::get_checksum") do
  dispatch :get_checksum do
    param 'String', :url
    param 'String', :beat
    param 'String', :version
    return_type 'String'
  end
  # the function below is called by puppet and and must match
  # the name of the puppet function above. You can set your
  # required parameters below and puppet will enforce these
  # so change x to suit your needs although only one parameter is required
  # as defined in the dispatch method.
  def get_checksum(url, beat, version)
    cache_dir = File.join(Puppet[:vardir], 'capsi-beats-hash-cache')
    cache = File.join(cache_dir, beat + version)

    if File.exist? cache
      File.read(cache)
    else
      checksum = http_get_checksum(url + ".sha512")

      FileUtils.mkdir_p(cache_dir)
      File.open(cache, 'w', 0o600) do |c|
        c.write(checksum)
      end
      File.chown(File.stat(Puppet[:vardir]).uid, nil, cache)
      File.chown(File.stat(Puppet[:vardir]).uid, nil, cache_dir)
      checksum
    end
  end

  def http_get_checksum(final_url)
    require 'open-uri'
    require 'timeout'

    begin
      result = Timeout::timeout(5) {
        uri = URI.parse(final_url)
        uri.read
      }
      sum = result[/[a-f0-9]{128}/]
      if sum == nil
        raise Puppet::ParseError, "Failed to get the checksum from artifacts.elastic.co: No checksum"
      end
      sum
    rescue Exception => e
      raise Puppet::ParseError, "Failed to get the checksum from artifacts.elastic.co: Timeout"
    end
  end
end
