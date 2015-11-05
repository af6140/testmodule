# == Class testmodule::install
#
# This class is called from testmodule for install.
#
class testmodule::install {

  package { $::testmodule::package_name:
    ensure => present,
  }
}
