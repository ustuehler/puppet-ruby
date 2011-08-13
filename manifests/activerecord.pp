class ruby::activerecord
{
	case $operatingsystem {
	    Debian: {
		package { libactiverecord-ruby:
			ensure => present
		}
	    }

	    default: {
		fail("$operatingsystem is currently not supported")
	    }
	}
}
