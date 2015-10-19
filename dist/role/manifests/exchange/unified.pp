class role::exchange::unified {
  contain profile::base
  contain profile::domain_member
  contain profile::exchange::unified
  #Ordering execution
  Class['profile::base'] -> Class['profile::domain_member'] -> Class['profile::exchange::unified']
}