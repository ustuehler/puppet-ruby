# Class: ruby::passenger
#
# Ensure that the Rails application server gem "passenger" is
# installed.
#
# Requires:
#   - ruby::gem()
#   - Class[ruby::rails]
#   - Package[ruby-rails]
#
class ruby::passenger {
  include ruby::rails

  ruby::gem { passenger:
    ensure => installed,
    require => Package[ruby-rails]
  }
}
