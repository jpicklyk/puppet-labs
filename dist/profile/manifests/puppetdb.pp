

class profile::puppetdb(
  $server_name = undef
) {
  #include ::puppetdb
  notify {'Applying profile: puppetdb':}

  firewall { '100 allow PuppetDB access':
    dport   => '8081',
    proto  => tcp,
    action => accept,
  }
  if $server_name {
    $_puppetdb = $server_name
  } else {
    $_puppetdb = 'puppetdb'
  }

  #Configure puppetdb and its underlying database
  class {'puppetdb':}
  #Configure puppet master to use the puppetdb
  class { 'puppetdb::master::config':
    puppetdb_server => $_puppetdb,
  }
  contain puppetdb
}