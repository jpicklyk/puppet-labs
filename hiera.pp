Package {
  allow_virtual => true,
}

class {'hiera':
  hierarchy => [
    'clientcert/%{clientcert}',
    'lab/%{puppet_lab}',
    'puppet_role/%{puppet_role}',
    'global',
  ],
  datadir   => '/etc/puppetlabs/code/environments/%{::environment}/hieradata',
}
