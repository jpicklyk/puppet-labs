class profile::hiera {
  notify {'Applying profile: hiera':}
  package {['hiera','hiera-puppet']:
    ensure => present,
    
  }
}