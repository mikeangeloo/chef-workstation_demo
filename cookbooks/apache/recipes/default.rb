#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.

apt_update 'Update the apt cache daily' do
    frequency 86400
    action :periodic
end

package 'apache2' #install apache2

service 'apache2' do
    supports :status => true
    action :nothing
end 

file '/etc/apache2/sites-enabled/000-default.conf' do
    action :delete
end

template '/etc/apache2/sites-available/vagrant.conf' do
    source 'virtual-hosts.conf.erb'
    notifies :restart, resources(:service => "apache2")
end

link '/etc/apache2/sites-enabled/vagrant.conf' do
    to '/etc/apache2/sites-available/vagrant.conf'
    notifies :restart, resources(:service => "apache2")
end

# cookbook_file "#{node['apache']['document_root']}/index.html" do
#     source 'index.html'
#     only_if do
#         File.exist?('/etc/apache2/sites-enabled/vagrant.conf')
#     end
# end

cookbook_file '/etc/apache2/sites-available/ejemplo.conf' do
    action :create
end
    

include_recipe '::facts'

#### act2
cookbook_file '/etc/apache2/sites-available/wordpress.conf' do #does to do
  source 'wordpress.conf'
  action :create
  notifies :restart, resources(:service => "apache2")
end
 
link '/etc/apache2/sites-enabled/wordpress.conf' do #cookbook_link to link
   to '/etc/apache2/sites-available/wordpress.conf'
   notifies :restart, resources(:service => "apache2")
end
 
directory '/srv/www/wordpress' do
  action :create # new to create
end
 
# execute 'cp wordpress' do #exec to execute
#   action :run
#   command 'cp -r /wordpress/* /srv/www/wordpress'
# end

cookbook_file "#{node['apache']['document_root']}/script.py" do
    source 'script.py'
end

execute 'run python script' do
    action :run
    command 'python3 /vagrant/script.py'
end

# python 'hello world' do
#     code <<-EOH
#       print "Hello world! From Chef and Python."
#     EOH
#   end

cron 'runcron' do
    minute '0'
    hour '7'
    weekday '5'
    mailto 'done@done.es'
    action :create
    command 'echo skippin'
  end
  
  
  
    

