# Install python from homebrew.
#
# Usage:
#
#     include duply

class duply {
  include gnupg
  include homebrew

  homebrew::formula {
    'duply':
      before => Package[ 'boxen/brews/duply' ], ;
    'duplicity':
      before => Package[ 'boxen/brews/duplicity' ], ;
    'librsync':
      before => Package[ 'boxen/brews/librsync' ], ;
    'popt':
      before => Package[ 'boxen/brews/popt' ], ;
  }

  package {
    'boxen/brews/duply':
      ensure  => '1.6.0-boxen1',
      require => Package[ 'boxen/brews/duplicity' ];
    'boxen/brews/duplicity':
      ensure  => '0.6.22-boxen1',
      require => Package[ 'boxen/brews/librsync', 'boxen/brews/gnupg' ], ;
    'boxen/brews/librsync':
      ensure  => '0.9.7-boxen1',
      require => Package[ 'boxen/brews/popt' ], ;
    'boxen/brews/popt':
      ensure => '1.16-boxen1',
  }
}
