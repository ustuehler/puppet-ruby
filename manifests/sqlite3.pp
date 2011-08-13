# Class: ruby::sqlite3
#
# Install the Ruby extension for SQLite3 support.
#
class ruby::sqlite3 {
	case $operatingsystem {
	    Debian: {
		$package_name = 'libsqlite3-ruby'
	    }
	    OpenBSD: {
		$package_name = 'ruby-sqlite3'
	    }
	    default: {
		fail("$operatingsystem is currently unsupported")
	    }
	}

	package { ruby-sqlite3:
		name => $package_name,
		ensure => installed
	}
}
