class ruby::mysql
{
	case $operatingsystem {
	    Debian: {
		package { libmysql-ruby:
			ensure => present
		}
	    }
	    default: {
		fail("$operatingsystem is currently unsupported")
	    }
	}
}
