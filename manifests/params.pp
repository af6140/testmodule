# == Class testmodule::params
#
# This class is meant to be called from testmodule.
# It sets variables according to platform.
#
class testmodule::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'testmodule'
      $service_name = 'testmodule'
    }
    'RedHat', 'Amazon': {
      $package_name = 'testmodule'
      $service_name = 'testmodule'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
