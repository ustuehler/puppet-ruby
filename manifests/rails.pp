# Class: ruby::rails
#
# Ensure that the Ruby on Rails application framework is installed.
#
# Requires:
#   - Class[ruby::rake]
#
class ruby::rails {
  include ruby::rake

  case $operatingsystem {
    openbsd: {
      $package_name = "ruby-rails"
    }
    default: {
      $package_name = "rails"
    }
  }

  package { ruby-rails:
    name => $package_name,
    ensure => installed,
    require => Class[ruby-rake]
  }
}
