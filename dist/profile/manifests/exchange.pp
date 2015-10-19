class profile::exchange (
  $share        = hiera('profile::exchange::share'),
  $version      = hiera('profile::exchange::version', '2010'),
  $servicepack  = hiera('profile::exchange::servicepack', 1),
  $orgname      = hiera('profile::exchange::orgname', 'Test Organization')
){
  debug('Applying profile: exchange')
    
  $sp = $servicepack ? {
    1       => 'sp1',
    default => fail('Unknown Exchange service pack')
  }
  
  class {'::exchange':
    exchange_dir      => "${share}\\${version}\\${sp}",
    prereq_dir        => "${share}\\${version}",
    role              => $::exchange_role,
    organization_name => 'My Test Org',
    version           => $version,
  }  
  contain ::exchange
}