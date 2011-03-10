# Install Ruby gems support.
#
# == Requirements
#
# - Class[ruby]
#
class ruby::gems
{
	include ruby

	$class = inline_template("${name}::<%= operatingsystem.downcase %>")

	class { $class:
		require => Class[ruby]
	}
}
