class profile::shutdown (
  $time     = hiera('profile::shutdown::time'),
  $minutes  = hiera('profile::shutdown::minutes')
){
  
  validate_re($time, '^(?:([0-1][0-9])|([2][0-3])):([0-5]?[0-9])$', 'Time must be in the 24h format HH:MM')
  validate_re($minutes, '^\d+$')

  if $operatingsystem == 'Windows' {
    $seconds = $min * 60
    scheduled_task {'shutdown':
      ensure    => present,
      enabled   => true,
      command   => "c:\\windows\\system32\\shutdown.exe",
      arguments => "/s /t ${seconds} /d p:0:0 /c 'Automatic shutdown by Puppet'",
      trigger   => {
        schedule    => daily,
        every       => 1,
        start_time  => $time,
      }
    }
  } else {
    $pieces = split($time,":")    
    cron {'shutdown':
      command => "shutdown -P +${minutes} 'Automatic shutdown by puppet.  To cancel run shutdown -c'",
      user    => root,
      hour    => $pieces[0],
      minute  => $pieces[1],
    }
  }
}