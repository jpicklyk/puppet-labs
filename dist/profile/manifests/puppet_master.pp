class profile::puppet_master {
  include profile::linuxfw

  firewall { '100 allow Puppet master access':
    dport   => '8140',
    proto  => tcp,
    action => accept,
  }

  firewall { '100 allow ActiveMQ MCollective access':
    dport   => '61613',
    proto  => tcp,
    action => accept,
  }


}