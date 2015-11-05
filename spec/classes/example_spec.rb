require 'spec_helper'

describe 'testmodule' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "testmodule class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('testmodule::params') }
          it { is_expected.to contain_class('testmodule::install').that_comes_before('testmodule::config') }
          it { is_expected.to contain_class('testmodule::config') }
          it { is_expected.to contain_class('testmodule::service').that_subscribes_to('testmodule::config') }

          it { is_expected.to contain_service('testmodule') }
          it { is_expected.to contain_package('testmodule').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'testmodule class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('testmodule') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
