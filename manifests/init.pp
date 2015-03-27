# == Class: apache_wrapper
#
# Full description of class apache_wrapper here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { apache_wrapper:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2011 Your name here, unless otherwise noted.
#
class apache_wrapper (
  $vhosts = {},
  ) inherits ::apache::params {
include ::apache

  $defaults = {
	ensure          => present,
	port            => 80,
        docroot         => $::apache::params::docroot,
        serveradmin     => 'alerts@emergemedia.com',
	access_log_file => 'access_log',
	priority	=> '15',
	ip		=> undef,
	logroot_mode	=> $::apache::params::logroot_mode,
  }
  create_resources(::apache:vhost, $vhosts, $defaults)
}
