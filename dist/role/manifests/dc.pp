class role::dc {
  contain profile::base  # All roles should have the base profile
  contain profile::active_directory
  contain profile::dns
  Class['profile::base'] -> Class['profile::active_directory'] -> Class['profile::dns']
}