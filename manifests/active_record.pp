# Install the 'active_record' Ruby library
#
# == Required Facts
#
# - *operatingsystem*: The best installation method (Gems vs. native
#   packages) is chosen according to the operating system.
class ruby::active_record
{
  validate_string($::operatingsystem)

  case $::operatingsystem {
    Debian, Ubuntu: {
      package { 'libactiverecord-ruby':
        ensure => present
      }
    }

    default: {
      include ruby::gems

      package { 'activerecord':
        provider => gem,
        ensure   => present,
        require  => Class['ruby::gems']
      }
    }
  }
}
