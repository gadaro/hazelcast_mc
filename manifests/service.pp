##
# The hazelcastmc::service class It handles the Hazelcast management center service
#
class hazelcastmc::service inherits hazelcastmc {

  file { '/lib/systemd/system/hazelcastmc.service':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp("${module_name}/hazelcastmc.service.epp"),
  }
  -> service { 'hazelcastmc':
    ensure     => $::hazelcastmc::service_ensure,
    hasrestart => true,
    hasstatus  => true,
  }
}
