# Class: ruby::gems
#
# Install Ruby gems support.
#
# Requires:
#   - Package[ruby]
#
class ruby::gems {
  include ruby

  case $operatingsystem {
    openbsd: {
      $package_name = "ruby-gems"
      $gem = "/usr/local/bin/gem"
    }
    default: {
      $package_name = "ruby-gems"
      $gem = "/usr/bin/gem"
    }
  }

  package { ruby-gems:
    name => $package_name,
    ensure => installed,
    require => Package[ruby]
  }
}
