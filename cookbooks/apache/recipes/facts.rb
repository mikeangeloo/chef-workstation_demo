log 'Showing machine Ohai attributes' do
    message "Machine with #{node['memory']['total']} of memory and #{node['cpu']['total']} processor/s. \
    \nPlease check access to http://#{node[:network][:interfaces][:ens256][:addresses].detect{|k,v| v[:family] == 'inet'}.first}"
end