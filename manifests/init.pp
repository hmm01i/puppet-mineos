# Class: mineos
# ===========================
#
# Full description of class mineos here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `depends`
#  An array of package dependencies.
#  Default: (Varies by Distro)
#
# * `install_path`
#  Where to install MineOS. Default: ''/usr/games/minecraft'
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# Examples
# --------
#
# @example
#    class { 'mineos':
#      install_path = ''/opt/mineos'
#    }
#
# Authors
# -------
#
# Jacob Sohl <soothew@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Jacob Sohl
#
class mineos(
  $depends        = $mineos::params::package_depends,
  $install_path   = $mineos::params::install_path,
  $ensure_service = $mineos::params::ensure_service
) inherits mineos::params {

  validate_array($depends)

  anchor{ 'mineos::begin': }
  anchor{ 'mineos::end': }

  Anchor['mineos::begin'] ->
  Class['mineos::install'] ->
  Anchor['mineos::end']

  include mineos::install

}
