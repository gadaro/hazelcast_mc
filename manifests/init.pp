##
# The main class
#
# @summary This is the Hazelcast management center main module class.
#
# @example Declaring the class
#   include '::hazelcastmc'
#
# @param root_dir             The root directory of the Hazelcast management center installation, by default /opt
# @param version              The version of the Hazelcast management center
# @param package_name         The Hazelcast management center package name changes since 3.10 version
# @param war_name             The Hazelcast management center war name changes since 3.10 version
# @param download_url         The download URL of the package
# @param context_path         The url context path for the Hazelcast management center (mandatory)
# @param manage_users         This switch allow us to create the group and user to manage the Hazelcast management center process
# @param user                 The user of the Hazelcast management center process
# @param group                The group of the Hazelcast management center process
# @param java                 This parameter should point to the java executable
# @param java_options         This is a "free" string to add your favourite JVM's options
# @param service_ensure       The status desired for the service
#
class hazelcastmc(
  Optional[Stdlib::Absolutepath]    $root_dir,
  Optional[String]                  $version,
  Optional[String]                  $package_name,
  Optional[String]                  $war_name,
  Optional[Stdlib::Httpurl]         $download_url,
  Optional[String]                  $context_path,
  Optional[Boolean]                 $manage_user,
  Optional[String]                  $user,
  Optional[String]                  $group,
  Optional[Stdlib::Absolutepath]    $java,
  Optional[String]                  $java_options,
  Optional[Stdlib::Ensure::Service] $service_ensure,
){

  $install_dir        = join([$::hazelcastmc::root_dir, "${::hazelcastmc::package_name}-${::hazelcastmc::version}"], '/')
  $tmp_file           = '/tmp/hazelcastmc.tar.gz'

  contain '::hazelcastmc::install'
  contain '::hazelcastmc::service'

}
