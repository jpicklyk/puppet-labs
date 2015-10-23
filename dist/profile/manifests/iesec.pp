class profile::iesec (
  $admin = hiera('profile::iesec::admin'),
  $users  = hiera('profile::iesec::users')){

    notify {'Applying profile: iesec':}
    validate_bool($admin)
    validate_bool($users)

    if $admin {
      $iesec_admin = '1'
    } else {
      $iesec_admin = '0'
    }

    if $users {
      $iesec_users = '1'
    } else {
      $iesec_users = '0'
    }
    # Disable IE SEC for Admins
    registry_value { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
      ensure => present,
      type  => 'dword',
      data  => $iesec_admin,
    }

    # Disable IE SEC for Users
    registry_value { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
      ensure => present,
      type  => 'dword',
      data  => $iesec_users,
    }

  contain registry
}