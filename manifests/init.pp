# Class: ruby
#
# Install the Ruby language interpreter.  On operating systems which
# support multiple Ruby versions to be installed in parallel the "ruby"
# command will be set up use the default version.
#
# Requires:
# - Class['ruby::openbsd'] on OpenBSD
# - Class['ruby::debian'] on Debian and Ubuntu
class ruby {
  case $operatingsystem {
    Debian:  { include ruby::debian }
    OpenBSD: { include ruby::openbsd }
    Ubuntu:  { include ruby::debian }
    default: { fail("$operatingsystem is currently unsupported") }
  }
}

# Install the default Ruby interpreter for OpenBSD and install a
# symlink to it as /usr/local/bin/ruby.
class ruby::openbsd
{
  package { ruby: }

  file { '/usr/local/bin/ruby':
    ensure => 'ruby18',
    require => Package[ruby]
  }
}

# Install the default Ruby interpreter for Debian based Linux
# distributions.
class ruby::debian
{
  package { ruby: }
}

import 'classes/*.pp'
import 'defines/*.pp'
