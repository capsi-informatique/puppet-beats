# beats

This Puppet module allow the management of Elastic Beats. It's aimed to be simple and allow fine grained configuration
with Hiera and come with minimal default configuration.

## Table of Contents

1. [Description](#description)
1. [Roadmap](#roadmap)
1. [Setup](#setup)
    * [What beats affects](#what-beats-affects)
    * [Beginning with beats](#beginning-with-beats)
1. [Usage](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Actually, this module can only manage Filebeat and Metricbeat on Debian based OS.

## Roadmap

- Implement Packetbeat
- Implement Auditbeat
- Deploy on Windows Hosts
- Implement Winlogbeat
- Test the usage of the repository (some issues where identified in the past with the update)

## Setup

### What beats affects

Install Beats, manage it's configuration and service restart.

### Beginning with beats

## Usage

Coming soon

## Limitations

Agent compatibility: Filebeat, Metricbeat

Os compatibility: Debian.

## Development

Any contribution to this module are welcome.

## Documentation

[Filebeat Reference](https://www.elastic.co/guide/en/beats/filebeat/current/index.html)\
[Metricbeat Reference](https://www.elastic.co/guide/en/beats/metricbeat/current/index.html)
