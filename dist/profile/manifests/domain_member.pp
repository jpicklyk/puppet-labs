class profile::domain_member (
  $domain     = hiera('windows_ad::domainname'),
  $username   = hiera('profile::domain_member::username'),
  $password   = hiera('profile::domain_member::password')
) {
  notify {'Applying profile: domain_membership':}
  class {'::domain_membership':
    domain        => $domain,
    username      => $username,
    password      => $password,
  } ~>
  
  exec {"Service Change":
    command   => "\$service = gwmi win32_service -computer localhost -filter \"name='puppet'\";\$service.change(\$null,\$null,\$null,\$null,\$null,\$null,\"${username}@${domain}\",\"${password}\")",
    onlyif    => "if( (Get-WmiObject win32_service | where {\$_.Name -EQ 'puppet'}).StartName -eq '${username}@${domain}'){exit 1}",
    provider  => powershell,
  }
  
  contain '::domain_membership'
  
  reboot { 'domain_member::after':
    subscribe => Exec['Service Change']
  }
}