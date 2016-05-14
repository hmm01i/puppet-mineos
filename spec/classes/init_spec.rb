require 'spec_helper'

depends=[]
describe 'mineos' do
  class_depends=['stdlib','git']
  context 'on EL 6' do
    #testing EL6
    let(:facts){ {:osfamily => 'RedHat', :operatingsystemrelease => '6.7'} }
    context 'with default values for all parameters' do
    class_depends.each do |c|
      it { should contain_class(c)}
    end
      it { should contain_class('mineos::install') }
    end
  end
end
