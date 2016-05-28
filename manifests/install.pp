#installation components
class mineos::install () inherits mineos {

  ensure_packages($mineos::depends, { 'ensure' => 'present'})

  vcsrepo { $mineos::install_path:
    ensure   => present,
    provider => git,
    source   => 'https://github.com/hexparrot/mineos-node.git'
  }
  exec{ 'generate_sslcert':
    command => "${mineos::install_path}/generate-sslcert.sh",
    cwd     => $mineos::install_path,
    require => Vcsrepo["$mineos::install_path"],
    creates => '/etc/ssl/certs/mineos.pem'
  }
}
