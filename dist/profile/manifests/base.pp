class profile::base {
  notify {'Applying profile: base':}
    
  if $operatingsystem == 'Windows' {
    class {'profile::iesec':
      ensure => absent
    }
    contain profile::iesec
    #contain windows_puppet
    contain profile::win_default_apps
    #contain profile::software_share
    #Ensure chocolatey is installed and configured
    contain chocolatey
    contain profile::powershell
    contain profile::shutdown
    
    #Class['profile::iesec'] -> Class['profile::software_share'] -> Class['profile::powershell'] -> Class['profile::win_default_apps']
    Class['profile::iesec'] -> Class['profile::powershell'] -> Class['chocolatey'] -> Class['profile::win_default_apps']
  } elsif $operatingsystem == 'Ubuntu' {
    
  }
}
