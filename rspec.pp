# Behaviour Driven Development framework
class ruby::rspec
{
  case $::operatingsystem {
    Debian, Ubuntu: {
      package { 'librspec-ruby':
        ensure => present
      }
    }

    default: {
      include ruby::gems

      package { 'rspec':
        provider => gem,
        ensure   => present,
        require  => Class['ruby::gems']
      }
    }
  }
}
