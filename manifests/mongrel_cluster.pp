class ruby::mongrel_cluster {
  include ruby::mongrel

  case $operatingsystem {
    default: {
      $package_name = 'ruby-mongrel_cluster'
    }
  }

  package { ruby-mongrel_cluster:
    name    => $package_name,
    ensure  => installed,
    require => Package[ruby-mongrel]
  }

  file { ["/etc/mongrel_cluster", "/var/run/mongrel_cluster"]:
    ensure  => directory,
    require => Package[ruby-mongrel_cluster]
  }
}
