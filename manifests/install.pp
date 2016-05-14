#installation components
class mineos::install () inherits mineos {
  include ::nodejs
  ensure_packages($mineos::depends, { 'ensure' => 'present'})

  vcsrepo { $mineos::install_path:
    ensure   => present,
    provider => git,
    source   => 'https://github.com/hexparrot/mineos-node.git'
  }
}
