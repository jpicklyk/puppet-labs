class profile::puppet_master {

  firewall { '100 allow Puppet master access':
    port   => '8140',
    proto  => tcp,
    action => accept,
  }

  firewall { '100 allow ActiveMQ MCollective access':
    port   => '61613',
    proto  => tcp,
    action => accept,
  }

  contain ::linuxfw
}