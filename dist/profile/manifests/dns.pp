class profile::dns (
  $forwarders     = hiera('profile::dns::forwarders', "'8.8.8.8','8.8.4.4'"),
  $reordering     = hiera('profile::dns::reordering', false),
  $zonename       = hiera('windows_ad::domainname'),
  $dynamicupdate  = hiera('profile::dns::dynamicupdate', 1)
){
  
  windows_dns::forwarder {'Google forwarder':
    ensure    => present,
    ipaddress => $forwarders,
  }
  
  windows_dns::zoneconfig {'Azure requirement':
    zonename      => $zonename,
    dynamicupdate => $dynamicupdate,
  }
  contain windows_dns
}