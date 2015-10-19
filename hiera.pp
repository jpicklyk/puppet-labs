Package {
  allow_virtual => true,
}

class {'hiera':
  hierarchy => [
    '%{clientcert}',
    'lab/%{puppet_lab},
    'puppet_role/%{puppet_role}',
    'common',
  ],
  datadir   => '/etc/puppetlabs/code/environments/%{environment}/hiera',
}
