# Define: ruby::gem
#
# Ensure that the named Ruby gem is installed in the system (present)
# or uninstalled (absent).
#
# Requires:
#   - Class[ruby::gems]
#   - Package[ruby-gems]
#
define ruby::gem($ensure = present) {
  include ruby::gems

  case $ensure {
    present,installed: {
      $command = 'install'
      $onlyif = "$ruby::gems::gem query -l -i -n '$name' | grep false"
    }
    absent,uninstalled: {
      $command = 'uninstall'
      $onlyif = "$ruby::gems::gem query -l -i -n '$name' | grep true"
    }
    default: {
      fail("Invalid value for ensure: $ensure")
    }
  }

  exec { "ruby::gem $command $name":
    command   => "$ruby::gems::gem $command '$name'",
    onlyif    => $onlyif,
    logoutput => on_failure,
    require   => Package[ruby-gems]
  }
}
