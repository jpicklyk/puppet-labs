class role::exchange::mailbox {
  contain profile::base
  contain profile::domain_member
  contain profile::exchange::mailbox
  #Ordering execution
  Class['profile::base'] -> Class['profile::domain_member'] -> Class['profile::exchange::mailbox']
}