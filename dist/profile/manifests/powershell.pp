class profile::powershell(  
  $version = hiera('profile::powershell::version')
){
  if($kernelversion =~ /^6\.1/) {
    notify{'Applying profile: powershell':}
    ### MSU file are not supported with package yet ###
#    package { 'Microsoft Windows Management Framework 4.0 (KB2819745)':
#      ensure => 'installed',
#      source => "${share}${filename}",    
#      install_options => ['/quiet','/norestart'],
#    }
    reboot{'before powershell':
      when  => pending,
    }
    
    class{'windowsps':
      version => $version,
      required => Reboot['before powershell']
    }
    contain ::windowsps
    
    reboot{'after powershell':
      subscribe => Class['windowsps']
    } 
  }
}