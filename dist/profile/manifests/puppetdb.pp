# == Class: profile::puppetdb
#
# PuppetDB profile
#
# === Parameters
#
# None
#
# === Variables
#
# None
#
# === Examples
#
#  include profile::puppetdb

class profile::puppetdb {
  #include ::puppetdb
  notify {'Applying profile: puppetdb':}

  firewall { '100 allow PuppetDB access':
    dport   => '8081',
    proto  => tcp,
    action => accept,
  }

  #Configure puppetdb and its underlying database
  class {'puppetdb':}
  #Configure puppet master to use the puppetdb
  class { 'puppetdb::master::config':}
}