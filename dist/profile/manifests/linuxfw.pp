class profile::linuxfw {
  # This clears any existing rules and makes sure that only rules defined in puppet exist
  resources { 'firewall':
    purge => true
  }

  Firewall {
    before => Class['profile::linuxfw::post'],
    require => Class['profile::linuxfw::pre'],
  }
  #Declare the pre and post classes to satisfy dependencies
  class {['profile::linuxfw::pre', 'profile::linuxfw::post']:}
  #include the firewall class to ensure correct packages are installed
  class {'firewall':}
}