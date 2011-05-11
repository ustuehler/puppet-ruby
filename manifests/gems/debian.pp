# Install Rubygems for Debian.  In addition to installing the "rubygems"
# package this will make sure that executables created with "gem install"
# are available in /usr/local/bin, moving existing executables there if
# necessary.
class ruby::gems::debian
{
	package { 'rubygems1.8':
		ensure => installed
	}

	exec { "/bin/sh -c 'mv -f /var/lib/gems/1.8/bin/* /usr/local/bin; rm -rf /var/lib/gems/1.8/bin'":
		unless => "/usr/bin/test -h /var/lib/gems/1.8/bin",
		require => Package['rubygems1.8']
	}->file { "/var/lib/gems/1.8/bin":
		ensure => "/usr/local/bin"
	}
}
