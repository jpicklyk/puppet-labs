class profile::iesec (
  $administrators = undef,
  $users  = undef,
  $ensure = undef,){
    $key_loc = "HKLM\\SOFTWARE\\Microsoft\\Active Setup\\Installed Components"
    if $::operatingsystem != 'Windows' {
      fail ("Class[iesec] can only be applied to Windows systems. It cannot be used on \"${::operatingsystem}.\"")
    }
    notify {'Applying profile: iesec':}

    case $ensure {
      'present' : {
        $iesec_users = $users ? {
          'off'   => 0,
          default => 1,
        }
        $iesec_admin = $administrators ? {
          'off'   => 0,
          default => 1,
        }
      }
      'absent': {
        $iesec_admin = 0
        $iesec_users = 0
      }
      default : {fail('You must specify ensure')}
    }


    # Disable IE SEC for Admins
    registry::value { '{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
      key     => $key_loc,
      type    => 'dword',
      data    => $iesec_admin,
    }

    # Disable IE SEC for Users
    registry::value { '{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
      key     => $key_loc,
      type    => 'dword',
      data    => $iesec_users,
    }


}