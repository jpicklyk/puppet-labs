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
  #Configure puppetdb and its underlying database
  class {'puppetdb':}
  #Configure puppet master to use the puppetdb
  class { 'puppetdb::master::config':}
}