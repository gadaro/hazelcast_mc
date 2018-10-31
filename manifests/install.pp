##
# The hazelcastmc::install class It commands the installation of the tar.gz file
#
class hazelcastmc::install inherits hazelcastmc {
  include ::archive

  File {
    owner => $::hazelcastmc::user,
    group => $::hazelcastmc::group,
    mode  => '0750',
  }

  if $::hazelcastmc::manage_user {
    ensure_resource('group', $::hazelcastmc::group, {
      ensure => present,
    })
    ensure_resource('user', $::hazelcastmc::user, {
      ensure  => present,
      gid     => $::hazelcastmc::group,
      require => Group[$::hazelcast::group],
    })
  }

  archive { $::hazelcastmc::tmp_file:
    ensure       => present,
    extract      => true,
    extract_path => $::hazelcastmc::root_dir,
    source       => $::hazelcastmc::download_url,
    creates      => join([$::hazelcastmc::install_dir, 'changelog.txt'], '/'),
    cleanup      => true,
  }
  -> file { $::hazelcastmc::install_dir:
    ensure  => directory,
    owner   => $::hazelcastmc::user,
    group   => $::hazelcastmc::group,
    mode    => '0750',
    recurse => true
  }

}
