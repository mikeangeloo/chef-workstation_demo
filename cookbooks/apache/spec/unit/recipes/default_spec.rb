#
# Cookbook:: apache
# Spec:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::default' do
  platform 'ubuntu'

  # let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '20.04').converge(described_recipe) }

  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'includes the apache2 recipe' do
      expect(chef_run).to include_recipe('apache::default')
    end

    it 'should have vagrant variable' do
      expect(chef_run.node['apache']['document_root']).to eq('/vagrant')
    end

  end
end
