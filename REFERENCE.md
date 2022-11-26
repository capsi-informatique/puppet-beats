# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

#### Public Classes

* [`beats::config::filebeat`](#beatsconfigfilebeat): Configuration of filebeat
* [`beats::config::metricbeat`](#beatsconfigmetricbeat): Configuration of filebeat
* [`beats::filebeat`](#beatsfilebeat): Install and manage filebeat service and configuration file
* [`beats::install::debian::remove_repo`](#beatsinstalldebianremove_repo): Remove the elastic repository
* [`beats::metricbeat`](#beatsmetricbeat): Install and manage metricbeat service and configuration file
* [`beats::modules::filebeat::apache`](#beatsmodulesfilebeatapache): Configuration of apache filebeat module
* [`beats::modules::filebeat::auditd`](#beatsmodulesfilebeatauditd): Configuration of audits filebeat module
* [`beats::modules::filebeat::elasticsearch`](#beatsmodulesfilebeatelasticsearch): Configuration of elasticsearch filebeat module
* [`beats::modules::filebeat::haproxy`](#beatsmodulesfilebeathaproxy): Configuration of haproxy eilebeat module
* [`beats::modules::filebeat::iptables`](#beatsmodulesfilebeatiptables): Configuration of iptables filebeat module
* [`beats::modules::filebeat::kibana`](#beatsmodulesfilebeatkibana): Configuration of kibana filebeat module
* [`beats::modules::filebeat::mysql`](#beatsmodulesfilebeatmysql): Configuration of mysql filebeat module
* [`beats::modules::filebeat::nginx`](#beatsmodulesfilebeatnginx): Configuration of nginx filebeat module
* [`beats::modules::filebeat::postgresql`](#beatsmodulesfilebeatpostgresql): Configuration of postgresql filebeat module
* [`beats::modules::filebeat::system`](#beatsmodulesfilebeatsystem): Configuration of system filebeat module
* [`beats::modules::metricbeat::apache`](#beatsmodulesmetricbeatapache): Configuration of apache metricbeat module
* [`beats::modules::metricbeat::beat`](#beatsmodulesmetricbeatbeat): Configuration of beat metricbeat module
* [`beats::modules::metricbeat::docker`](#beatsmodulesmetricbeatdocker): Configuration of docker metricbeat module
* [`beats::modules::metricbeat::elasticsearch`](#beatsmodulesmetricbeatelasticsearch): Configuration of elasticsearch metricbeat module
* [`beats::modules::metricbeat::kibana`](#beatsmodulesmetricbeatkibana): Configuration of kibana metricbeat module
* [`beats::modules::metricbeat::linux`](#beatsmodulesmetricbeatlinux): Configuration of linux metricbeat module
* [`beats::modules::metricbeat::mongodb`](#beatsmodulesmetricbeatmongodb): Configuration of mongodb metricbeat module
* [`beats::modules::metricbeat::mysql`](#beatsmodulesmetricbeatmysql): Configuration of mysql metricbeat module
* [`beats::modules::metricbeat::nginx`](#beatsmodulesmetricbeatnginx): Configuration of nginx metricbeat module
* [`beats::modules::metricbeat::system`](#beatsmodulesmetricbeatsystem): Configuration of system metricbeat module

#### Private Classes

* `beats::install::debian::filebeat`: Install and manage filebeat service and configuration file on Debian
* `beats::install::debian::metricbeat`: Install and manage metricbeat service and configuration file on Debian

### Functions

* [`beats::get_checksum`](#beatsget_checksum): Retrieves beat SHA-512 Hash from a cache file, or get it from artifacts.elastic.co

## Classes

### <a name="beatsconfigfilebeat"></a>`beats::config::filebeat`

Configuration of filebeat

#### Parameters

The following parameters are available in the `beats::config::filebeat` class:

* [`enable_input_log`](#enable_input_log)
* [`enable_input_filestream`](#enable_input_filestream)
* [`paths_input_log`](#paths_input_log)
* [`paths_input_filestream`](#paths_input_filestream)
* [`output_elasticsearch`](#output_elasticsearch)
* [`output_logstash`](#output_logstash)
* [`processors`](#processors)
* [`override_input_log`](#override_input_log)
* [`override_input_filestream`](#override_input_filestream)
* [`override_config_setup`](#override_config_setup)
* [`override`](#override)

##### <a name="enable_input_log"></a>`enable_input_log`

Data type: `Boolean`



##### <a name="enable_input_filestream"></a>`enable_input_filestream`

Data type: `Boolean`



##### <a name="paths_input_log"></a>`paths_input_log`

Data type: `Array[String]`



##### <a name="paths_input_filestream"></a>`paths_input_filestream`

Data type: `Array[String]`



##### <a name="output_elasticsearch"></a>`output_elasticsearch`

Data type: `Optional[Hash[String, Any]]`



##### <a name="output_logstash"></a>`output_logstash`

Data type: `Optional[Hash[String, Any]]`



##### <a name="processors"></a>`processors`

Data type: `Array[Hash[String, Any]]`



##### <a name="override_input_log"></a>`override_input_log`

Data type: `Hash[String, Any]`



Default value: `{}`

##### <a name="override_input_filestream"></a>`override_input_filestream`

Data type: `Hash[String, Any]`



Default value: `{}`

##### <a name="override_config_setup"></a>`override_config_setup`

Data type: `Hash[String, Any]`



Default value: `{}`

##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsconfigmetricbeat"></a>`beats::config::metricbeat`

Configuration of filebeat

#### Parameters

The following parameters are available in the `beats::config::metricbeat` class:

* [`output_elasticsearch`](#output_elasticsearch)
* [`output_logstash`](#output_logstash)
* [`processors`](#processors)
* [`override_config_setup`](#override_config_setup)
* [`override`](#override)

##### <a name="output_elasticsearch"></a>`output_elasticsearch`

Data type: `Optional[Hash[String, Any]]`



##### <a name="output_logstash"></a>`output_logstash`

Data type: `Optional[Hash[String, Any]]`



##### <a name="processors"></a>`processors`

Data type: `Array[Hash[String, Any]]`



##### <a name="override_config_setup"></a>`override_config_setup`

Data type: `Hash[String, Any]`



Default value: `{}`

##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsfilebeat"></a>`beats::filebeat`

Install and manage filebeat service and configuration file

#### Examples

##### 

```puppet
class { beats::filebeat:
  version => '7.17',
}
```

#### Parameters

The following parameters are available in the `beats::filebeat` class:

* [`version`](#version)
* [`checksum`](#checksum)
* [`arch`](#arch)
* [`service_ensure`](#service_ensure)
* [`service_atboot`](#service_atboot)

##### <a name="version"></a>`version`

Data type: `String`

The version of the beat to install

##### <a name="checksum"></a>`checksum`

Data type: `String`

The SHA-512 checksum of the Debian package or "auto"

Default value: `'auto'`

##### <a name="arch"></a>`arch`

Data type: `String`

The architecture of the beat to download

Default value: `$facts['os']['architecture']`

##### <a name="service_ensure"></a>`service_ensure`

Data type: `String`



Default value: `'running'`

##### <a name="service_atboot"></a>`service_atboot`

Data type: `Boolean`



Default value: ``true``

### <a name="beatsinstalldebianremove_repo"></a>`beats::install::debian::remove_repo`

Remove the elastic repository

#### Examples

##### 

```puppet
include beats::install::debian::remove_repo
```

#### Parameters

The following parameters are available in the `beats::install::debian::remove_repo` class:

* [`remove_repository`](#remove_repository)
* [`name`](#name)

##### <a name="remove_repository"></a>`remove_repository`

Data type: `Boolean`

Set to true to remove the elastic repository from the system
This allow the installation of the .deb without using a repository

Default value: ``true``

##### <a name="name"></a>`name`

Data type: `String`

Name of the repository in `/etc/apt/sources.list.d`

Default value: `'elastic'`

### <a name="beatsmetricbeat"></a>`beats::metricbeat`

Install and manage metricbeat service and configuration file

#### Examples

##### 

```puppet
class { beats::metricbeat:
  version => '7.17',
}
```

#### Parameters

The following parameters are available in the `beats::metricbeat` class:

* [`version`](#version)
* [`checksum`](#checksum)
* [`arch`](#arch)
* [`service_ensure`](#service_ensure)
* [`service_atboot`](#service_atboot)

##### <a name="version"></a>`version`

Data type: `String`

The version of the beat to install

##### <a name="checksum"></a>`checksum`

Data type: `String`

The SHA-512 checksum of the Debian package or "auto"

Default value: `'auto'`

##### <a name="arch"></a>`arch`

Data type: `String`

The architecture of the beat to download

Default value: `$architecture`

##### <a name="service_ensure"></a>`service_ensure`

Data type: `String`



Default value: `'running'`

##### <a name="service_atboot"></a>`service_atboot`

Data type: `Boolean`



Default value: ``true``

### <a name="beatsmodulesfilebeatapache"></a>`beats::modules::filebeat::apache`

Configuration of apache filebeat module

#### Parameters

The following parameters are available in the `beats::modules::filebeat::apache` class:

* [`enable`](#enable)
* [`enable_access`](#enable_access)
* [`enable_error`](#enable_error)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="enable_access"></a>`enable_access`

Data type: `Boolean`



##### <a name="enable_error"></a>`enable_error`

Data type: `Boolean`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesfilebeatauditd"></a>`beats::modules::filebeat::auditd`

Configuration of audits filebeat module

#### Parameters

The following parameters are available in the `beats::modules::filebeat::auditd` class:

* [`enable`](#enable)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesfilebeatelasticsearch"></a>`beats::modules::filebeat::elasticsearch`

Configuration of elasticsearch filebeat module

#### Parameters

The following parameters are available in the `beats::modules::filebeat::elasticsearch` class:

* [`enable`](#enable)
* [`enable_server`](#enable_server)
* [`enable_gc`](#enable_gc)
* [`enable_audit`](#enable_audit)
* [`enable_slowlog`](#enable_slowlog)
* [`enable_deprecation`](#enable_deprecation)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="enable_server"></a>`enable_server`

Data type: `Boolean`



##### <a name="enable_gc"></a>`enable_gc`

Data type: `Boolean`



##### <a name="enable_audit"></a>`enable_audit`

Data type: `Boolean`



##### <a name="enable_slowlog"></a>`enable_slowlog`

Data type: `Boolean`



##### <a name="enable_deprecation"></a>`enable_deprecation`

Data type: `Boolean`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesfilebeathaproxy"></a>`beats::modules::filebeat::haproxy`

Configuration of haproxy eilebeat module

#### Parameters

The following parameters are available in the `beats::modules::filebeat::haproxy` class:

* [`enable`](#enable)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesfilebeatiptables"></a>`beats::modules::filebeat::iptables`

Configuration of iptables filebeat module

#### Parameters

The following parameters are available in the `beats::modules::filebeat::iptables` class:

* [`enable`](#enable)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesfilebeatkibana"></a>`beats::modules::filebeat::kibana`

Configuration of kibana filebeat module

#### Parameters

The following parameters are available in the `beats::modules::filebeat::kibana` class:

* [`enable`](#enable)
* [`enable_log`](#enable_log)
* [`enable_audit`](#enable_audit)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="enable_log"></a>`enable_log`

Data type: `Boolean`



##### <a name="enable_audit"></a>`enable_audit`

Data type: `Boolean`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesfilebeatmysql"></a>`beats::modules::filebeat::mysql`

Configuration of mysql filebeat module

#### Parameters

The following parameters are available in the `beats::modules::filebeat::mysql` class:

* [`enable`](#enable)
* [`enable_error`](#enable_error)
* [`enable_slowlog`](#enable_slowlog)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="enable_error"></a>`enable_error`

Data type: `Boolean`



##### <a name="enable_slowlog"></a>`enable_slowlog`

Data type: `Boolean`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesfilebeatnginx"></a>`beats::modules::filebeat::nginx`

Configuration of nginx filebeat module

#### Parameters

The following parameters are available in the `beats::modules::filebeat::nginx` class:

* [`enable`](#enable)
* [`enable_access`](#enable_access)
* [`enable_error`](#enable_error)
* [`enable_ingress_controller`](#enable_ingress_controller)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="enable_access"></a>`enable_access`

Data type: `Boolean`



##### <a name="enable_error"></a>`enable_error`

Data type: `Boolean`



##### <a name="enable_ingress_controller"></a>`enable_ingress_controller`

Data type: `Boolean`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesfilebeatpostgresql"></a>`beats::modules::filebeat::postgresql`

Configuration of postgresql filebeat module

#### Parameters

The following parameters are available in the `beats::modules::filebeat::postgresql` class:

* [`enable`](#enable)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesfilebeatsystem"></a>`beats::modules::filebeat::system`

Configuration of system filebeat module

#### Parameters

The following parameters are available in the `beats::modules::filebeat::system` class:

* [`enable`](#enable)
* [`enable_syslog`](#enable_syslog)
* [`enable_auth`](#enable_auth)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="enable_syslog"></a>`enable_syslog`

Data type: `Boolean`



##### <a name="enable_auth"></a>`enable_auth`

Data type: `Boolean`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesmetricbeatapache"></a>`beats::modules::metricbeat::apache`

Configuration of apache metricbeat module

#### Parameters

The following parameters are available in the `beats::modules::metricbeat::apache` class:

* [`enable`](#enable)
* [`hosts`](#hosts)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="hosts"></a>`hosts`

Data type: `Array[String]`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesmetricbeatbeat"></a>`beats::modules::metricbeat::beat`

Configuration of beat metricbeat module

#### Parameters

The following parameters are available in the `beats::modules::metricbeat::beat` class:

* [`enable`](#enable)
* [`hosts`](#hosts)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="hosts"></a>`hosts`

Data type: `Array[String]`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesmetricbeatdocker"></a>`beats::modules::metricbeat::docker`

Configuration of docker metricbeat module

#### Parameters

The following parameters are available in the `beats::modules::metricbeat::docker` class:

* [`enable`](#enable)
* [`hosts`](#hosts)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="hosts"></a>`hosts`

Data type: `Array[String]`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesmetricbeatelasticsearch"></a>`beats::modules::metricbeat::elasticsearch`

Configuration of elasticsearch metricbeat module

#### Parameters

The following parameters are available in the `beats::modules::metricbeat::elasticsearch` class:

* [`enable`](#enable)
* [`hosts`](#hosts)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="hosts"></a>`hosts`

Data type: `Array[String]`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesmetricbeatkibana"></a>`beats::modules::metricbeat::kibana`

Configuration of kibana metricbeat module

#### Parameters

The following parameters are available in the `beats::modules::metricbeat::kibana` class:

* [`enable`](#enable)
* [`hosts`](#hosts)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="hosts"></a>`hosts`

Data type: `Array[String]`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesmetricbeatlinux"></a>`beats::modules::metricbeat::linux`

Configuration of linux metricbeat module

#### Parameters

The following parameters are available in the `beats::modules::metricbeat::linux` class:

* [`enable`](#enable)
* [`metrics`](#metrics)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="metrics"></a>`metrics`

Data type: `Array[String]`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesmetricbeatmongodb"></a>`beats::modules::metricbeat::mongodb`

Configuration of mongodb metricbeat module

#### Parameters

The following parameters are available in the `beats::modules::metricbeat::mongodb` class:

* [`enable`](#enable)
* [`hosts`](#hosts)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="hosts"></a>`hosts`

Data type: `Array[String]`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesmetricbeatmysql"></a>`beats::modules::metricbeat::mysql`

Configuration of mysql metricbeat module

#### Parameters

The following parameters are available in the `beats::modules::metricbeat::mysql` class:

* [`enable`](#enable)
* [`hosts`](#hosts)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="hosts"></a>`hosts`

Data type: `Array[String]`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesmetricbeatnginx"></a>`beats::modules::metricbeat::nginx`

Configuration of nginx metricbeat module

#### Parameters

The following parameters are available in the `beats::modules::metricbeat::nginx` class:

* [`enable`](#enable)
* [`hosts`](#hosts)
* [`status_path`](#status_path)
* [`override`](#override)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="hosts"></a>`hosts`

Data type: `Array[String]`



##### <a name="status_path"></a>`status_path`

Data type: `String`



##### <a name="override"></a>`override`

Data type: `Hash[String, Any]`



Default value: `{}`

### <a name="beatsmodulesmetricbeatsystem"></a>`beats::modules::metricbeat::system`

Configuration of system metricbeat module

#### Parameters

The following parameters are available in the `beats::modules::metricbeat::system` class:

* [`enable`](#enable)
* [`metrics_base`](#metrics_base)
* [`override_base`](#override_base)
* [`override_fs`](#override_fs)
* [`override_uptime`](#override_uptime)

##### <a name="enable"></a>`enable`

Data type: `Boolean`



##### <a name="metrics_base"></a>`metrics_base`

Data type: `Array[String]`



##### <a name="override_base"></a>`override_base`

Data type: `Hash[String, Any]`



Default value: `{}`

##### <a name="override_fs"></a>`override_fs`

Data type: `Hash[String, Any]`



Default value: `{}`

##### <a name="override_uptime"></a>`override_uptime`

Data type: `Hash[String, Any]`



Default value: `{}`

## Functions

### <a name="beatsget_checksum"></a>`beats::get_checksum`

Type: Ruby 4.x API

Retrieves beat SHA-512 Hash from a cache file, or get it from artifacts.elastic.co

#### Examples

##### 

```puppet
$checksum = get_checksum($url)
```

#### `beats::get_checksum(String $url, String $beat, String $version)`

The beats::get_checksum function.

Returns: `String`

##### Examples

###### 

```puppet
$checksum = get_checksum($url)
```

##### `url`

Data type: `String`



##### `beat`

Data type: `String`



##### `version`

Data type: `String`


