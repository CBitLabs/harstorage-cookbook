package 'git'

node['harstorage']['packages'].each do |pkg|
   package pkg do
      action :install
   end
end

directory 'harstorage parent directory' do
  path  '/var/www'
  owner node['harstorage']['owner']
  group node['harstorage']['owner']
  recursive true
  action :create
end

directory 'harstorage directory' do
  path  node['harstorage']['code-directory']
  owner node['harstorage']['owner']
  group node['harstorage']['owner']
  recursive true
  action :create
end

har_egg = "#{node['harstorage']['code-directory']}/harstorage.egg"
remote_file har_egg do
  source node['harstorage']['egg-source']
  not_if { ::File.exists?(har_egg) }
end

include_recipe 'harstorage::python'

git "/var/www/harstorage" do
  repository node['harstorage']['source-repository']
  destination "#{node['harstorage']['code-directory']}/source"
  action :sync
end

execute "install harstorage" do
   command ". #{node['harstorage']['virtualenv-activate']};  #{node['harstorage']['virtualenv-pip']} install ."
   cwd   "#{node['harstorage']['code-directory']}/source"
   user  node['harstorage']['owner']
   group node['harstorage']['owner']
#   creates "#{node['harstorage']['code-directory']}/setup.py"
end

template 'harstorage ini' do
  source 'harstorage.ini.erb'
  path   node['harstorage']['ini']
  owner  node['harstorage']['owner']
  mode   '0755'
  action :create
end

cookbook_file node['harstorage']['virtualenvhelper'] do
  source 'virtualenvhelper.sh'
  path   node['harstorage']['virtualenvhelper']
  owner  node['harstorage']['owner']
  mode 0755
  action :create
end

supervisor_service 'harstorage' do
  command node['harstorage']['supervisor']['command']
end

