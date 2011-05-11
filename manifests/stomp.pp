# Install the Ruby "stomp" library.
class ruby::stomp
{
	include ruby

	case $operatingsystem {
	    Debian: {
		package { libstomp-ruby:
			ensure => installed,
			require => Class[ruby]
		}
	    }

	    default: {
		fail("$operatingsystem is currently unsupported")
	    }
	}
}
