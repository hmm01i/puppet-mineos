require 'spec_helper'

depends=[]
describe 'mineos::install' do
  
  context 'on EL 6' do
    #testing EL6 
    let(:facts){ {:osfamily => 'RedHat', :operatingsystemrelease => '6.7'} }
    depends=['screen','wget','java-1.8.0-openjdk-headless.x86_64','openssl','openssl-devel']
    it { should contain_class('nodejs') }
    context 'with default values for all parameters' do
      depends.each do |p|
        it { should contain_package(p)}
      end
      it { should contain_vcsrepo('/usr/games/minecraft').with({
        'ensure'   => 'present',
        'provider' => 'git',
        'source'   => 'https://github.com/hexparrot/mineos-node.git'
        })
      }
    end
  end
end
