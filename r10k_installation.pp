Package {
  allow_virtual => true,
}

class { 'r10k':
  version           => '2.0.3',
  sources           => {
    'puppet' => {
      'remote'  => 'git@github.com:jpicklyk/puppet-labs.git',
      'basedir' => "${::settings::confdir}/environments",
      'prefix'  => false,
    },
  },
  manage_modulepath => false
}
