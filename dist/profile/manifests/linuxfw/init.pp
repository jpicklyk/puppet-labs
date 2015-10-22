class linuxfw {
  stage { 'fw_pre': before => Stage['main'];}
  stage { 'fw_post': require => Stage['main'];}

  class { 'ub_fw::pre':
    stage => 'fw_pre',
  }

  class { 'ub_fw::post':
    stage => 'fw_post',
  }

  resources { 'firewall':
    purge => true
  }
}