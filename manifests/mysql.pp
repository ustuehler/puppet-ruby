# Install the 'mysql' Ruby library
class ruby::mysql
{
  case $::operatingsystem {
    Debian, Ubuntu: {
      package { 'libmysql-ruby':
        ensure => present
      }
    }

    default: {
      fail("${::operatingsystem} is currently unsupported")
    }
  }
}
