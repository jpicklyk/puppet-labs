Package {
  allow_virtual => true,
}

class { 'r10k':
  version           => '1.5.1',
  sources           => {
    'puppet' => {
      'remote'  => 'git@github.com:jpicklyk/puppet-labs.git',
      'basedir' => "${::settings::confdir}/environments",
      'prefix'  => false,
    },
  },
  manage_modulepath => false
}
