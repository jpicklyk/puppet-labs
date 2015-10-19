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
  include ::puppetdb
  # For Puppet open source installed using passenger, we need to point to apache2 instead of puppetmaster
  class { 'puppetdb::master::config':
    puppet_service_name => 'apache2',
  }
}