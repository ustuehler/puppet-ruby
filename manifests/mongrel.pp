# Class: ruby::mongrel
#
# Install Mongrel, a fast webserver package for Ruby, often used as a
# replacement for WEBrick.
#
# Requires:
#   - Class[ruby]
#
class ruby::mongrel {
  include ruby

  case $operatingsystem {
    openbsd: {
      $package_name = "ruby-mongrel"
    }
    default: {
      $package_name = "mongrel"
    }
  }

  package { ruby-mongrel:
    name => $package_name,
    ensure => installed,
    require => Class[ruby]
  }
}
