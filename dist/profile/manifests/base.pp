class profile::base {
  notify {'Applying profile: base':}
    
  if $operatingsystem == 'Windows' {
    contain profile::iesec
    #contain windows_puppet
    contain profile::win_default_apps
    contain profile::software_share
    contain profile::powershell
    contain profile::shutdown
    
    Class['profile::iesec'] -> Class['profile::software_share'] -> Class['profile::powershell'] -> Class['profile::win_default_apps']
    
  } elsif $operatingsystem == 'Ubuntu' {
    
  }
}
