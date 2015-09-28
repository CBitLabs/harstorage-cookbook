
include_recipe 'apt'

a = node['harstorage']['mongo']['apt']
apt_repository 'mongodb-org' do
  uri a['uri']
  distribution a['distribution']
  key a['key']
  keyserver a['keyserver']
  action :add
end

node['harstorage']['mongo']['packages'].each do |pkg|
  apt_package pkg
end

directory node['harstorage']['mongo']['data-directory'] do
  owner 'mongodb'
  recursive true
  mode '0755'
  action :create
end

template 'mongod conf' do
  source 'mongod.conf.erb'
  path   node['harstorage']['mongo']['conf-file']
  mode   '0644'
  action :create
  notifies :restart, 'service[mongod]'
end

service 'mongod' do
  action [:enable, :start]
end
