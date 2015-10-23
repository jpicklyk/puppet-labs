class profile::linuxfw {
  notify {'Applying profile: linuxfw':}
  # This clears any existing rules and makes sure that only rules defined in puppet exist
  resources { 'firewall':
    purge => true
  }

  Firewall {
    before => Class['profile::linuxfw::post'],
    require => Class['profile::linuxfw::pre'],
  }
  #Declare the pre and post classes to satisfy dependencies
  include profile::linuxfw::pre, profile::linuxfw::post
  #include the firewall class to ensure correct packages are installed
  include firewall
}