class profile::win_default_apps(
    $applications = ["notepadplusplus.install","wireshark", "sysinternals","7zip.install","GoogleChrome","windirstat"]
  ) {

  notify {'Applying profile: win_default_apps':}
  package { $applications:
    ensure   => installed,
    provider => 'chocolatey',
  }
  #contain chocolatey
  
}