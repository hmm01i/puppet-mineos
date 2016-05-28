class mineos::service(){
  service{'mineos':
    ensure => $mineos::ensure_service
    }
}
