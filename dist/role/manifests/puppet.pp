class role::puppet {
  #Don't apply the base profile to the master server.
  #include profile::base
  include profile::puppet_master
  include profile::puppetdb
  include profile::hiera
}