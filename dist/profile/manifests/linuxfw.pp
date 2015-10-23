# Include a default set of pre and post firewall rules. This class is
# implemented using stages in order to ensure that you will be able to declare
# firewall rules in other classes and be assured proper order configuration of
# the firewall without ever accidentally cutting off connectivity (even
# temporarily).
class profile::linuxfw {
  include stdlib::stages
  notify {'Applying profile: linuxfw':}

  class { 'firewall':
    stage => 'setup'
  }
  class { 'profile::linuxfw::pre':
    stage => 'setup'
  }
  class { 'profile::linuxfw::post':
    stage => 'deploy'
  }
  # This clears any existing rules and makes sure that only rules defined in puppet exist
  resources { 'firewall':
    purge => true
  }

}