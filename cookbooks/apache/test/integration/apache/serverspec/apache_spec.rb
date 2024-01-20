
require 'spec_helper'

if os[:family] == 'ubuntu'
    describe package('apache2') do
        it {should be_installed}
    end
end

if os[:family] == 'redhat'
    describe package('apache2') do
        it {should be_installed}
    end
end

describe command('ls -al /') do
    its(:stdout) {should match /bin/}
end

describe service('apache2') do
    it {should be_enabled}
end

