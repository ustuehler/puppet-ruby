# Class: ruby::rake
#
# Ensure that the Ruby replacement for make (Rake) is installed.
#
# Requires:
#   - Class[ruby::rake]
#   - Package[ruby-rake]
#
class ruby::rake {
  include ruby

  case $operatingsystem {
    openbsd: {
      $package_name = "ruby-rake"
      $rake = "/usr/local/bin/rake"
    }
    default: {
      $package_name = "rake"
      $rake = "/usr/bin/rake"
    }
  }

  package { ruby-rake:
    name    => $package_name,
    ensure  => installed,
    require => Package[ruby]
  }
}
