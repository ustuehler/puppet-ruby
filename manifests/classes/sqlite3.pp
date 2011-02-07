# Class: ruby::sqlite3
#
# Install the Ruby extension for SQLite3 support.
#
class ruby::sqlite3 {
  case $operatingsystem {
    openbsd: {
      $package_name = 'ruby-sqlite3'
    }
    default: {
      $package_name = 'ruby-sqlite3'
    }
  }

  package { ruby-sqlite3:
    name => $package_name,
    ensure => installed
  }
}
