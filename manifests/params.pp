class mineos::params(){

  case $::osfamily {
    'RedHat': {
        $package_depends = ['screen','wget','java-1.8.0-openjdk-headless.x86_64', 'openssl', 'openssl-devel']
    }
    default : { notice('OS not supported')}
  }

  #MineOS settings
  $install_path='/usr/games/minecraft'
  $ensure_service='running'

}
