# Class: testmodule
# ===========================
#
# Full description of class testmodule here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class testmodule (
  $package_name = $::testmodule::params::package_name,
  $service_name = $::testmodule::params::service_name,
) inherits ::testmodule::params {

  # validate parameters here

  class { '::testmodule::install': } ->
  class { '::testmodule::config': } ~>
  class { '::testmodule::service': } ->
  Class['::testmodule']
}
