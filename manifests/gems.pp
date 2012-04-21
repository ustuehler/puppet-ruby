#  Enable system-wide RubyGems support
#
# == Facts
#
# - *operatingsystem*: Use to select the appropriate installation mechanism
#   for your operating system.
class ruby::gems
{
  include ruby

  $operatingsystem_class = downcase($::operatingsystem)

  class { $operatingsystem_class:
    require => Class['ruby']
  }
}
