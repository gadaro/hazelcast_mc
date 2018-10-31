
# hazelcastmc

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with hazelcastmc](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with hazelcast_mc](#beginning-with-hazelcastmc)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - Official documentation](#reference)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This module installs Hazelcast Management Center as a service.

It runs as a java process with included Jetty web server at port 8080 by default.

## Setup

### Setup Requirements

Starting with version 3.10, you need Java Runtime Environment 1.8 or later for running Hazelcast Management Center.

### Beginning with hazelcastmc

You can add the module and configure it with hiera, there is no need of further configuration. Example configurations:

```puppet
import '::hazelcastmc'
```

```puppet
hazelcastmc::version: '3.9.4'
hazelcastmc::package_name: 'management-center'
hazelcastmc::download_url: "https://download.hazelcast.com/management-center/%{lookup('hazelcastmc::package_name')}-%{lookup('hazelcastmc::version')}.tar.gz"
```

The package_name changes for versions 3.10 and newer so it is configurable. The same applies to the war name inside the tarball.

For a more detailed setup:

```puppet
hazelcastmc::version: '3.9.4'
hazelcastmc::package_name: 'management-center'
hazelcastmc::war_name: 'mancenter'
hazelcastmc::context_path: 'mancenter'
hazelcastmc::root_dir: '/opt'
hazelcastmc::service_ensure: 'running'
hazelcastmc::manage_user: true
hazelcastmc::user: 'hazelcastmc'
hazelcastmc::group: 'hazelcastmc'
hazelcastmc::download_url: "https://download.hazelcast.com/management-center/%{lookup('hazelcastmc::package_name')}-%{lookup('hazelcastmc::version')}.tar.gz"
hazelcastmc::java: '/usr/bin/java'
hazelcastmc::java_options: "-Dhazelcast.mancenter.home=%{lookup('hazelcastmc::root_dir')}/%{lookup('hazelcastmc::package_name')}-%{lookup('hazelcastmc::version')}/web-cache/"
```

The "web-cache" directory is used for users and other Hazelcast Management Center configurations.

## Usage

After the module is applied amd running, you can find the Hazelcast Management Center web portal under "http://localhost:8080/context_path". You can configure this "context_path".

## Reference

You can check the official documentation (3.9.4 version) [here](https://docs.hazelcast.org/docs/management-center/3.9.4/manual/html/Deploying_and_Starting.html)

## Limitations

The module supports only **OS distributions** based on systemd:

* Debian Stretch
* Debian Jessie
* CentOS 7

## Development

Fell free to comment or create any issue under https://github.com/gadaro/puppet-hazelcastmc/issues

## Release Notes

## v0.1.0 - October 31, 2018
Initial release
