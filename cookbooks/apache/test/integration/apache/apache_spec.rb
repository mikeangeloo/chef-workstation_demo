# Additional documentation: https://docs.chef.io/inspec/shell/
# https://docs.chef.io/inspec/plugin_kitchen_inspec/
# https://docs.chef.io/inspec/shell/
# https://docs.chef.io/inspec/resources/

# deprecated
# https://serverspec.org/resource_types.html

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

