# Install the Ruby "stomp" library.
class ruby::stomp
{
	include ruby

	case $operatingsystem {
	    OpenBSD: {
		package { ruby-stomp:
			ensure => present,
			require => Class[ruby]
		}
	    }

	    Debian: {
		package { libstomp-ruby:
			ensure => present,
			require => Class[ruby]
		}
	    }

	    default: {
		fail("$operatingsystem is currently unsupported")
	    }
	}
}
