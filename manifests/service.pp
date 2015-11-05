# == Class testmodule::service
#
# This class is meant to be called from testmodule.
# It ensure the service is running.
#
class testmodule::service {

  service { $::testmodule::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
