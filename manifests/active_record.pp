# Install the 'active_record' Ruby library
#
# == Required Facts
#
# - *operatingsystem*: The best installation method (Gems vs. native
#   packages) is chosen according to the operating system.
class ruby::activerecord
{
  validate_string($::operatingsystem)

  case $::operatingsystem {
    Debian, Ubuntu: {
      package { 'libactiverecord-ruby':
        ensure => present
      }
    }

    default: {
      fail("$::operatingsystem is currently not supported")
    }
  }
}
