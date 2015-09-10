#Sets up python, virtual environment and pip dependencies

include_recipe 'python'
# Creates location for virtualenv if it doesn't exist
# Ex: /usr/local/bitsight doesn't exist b/c bs-base 
# not run on the node

venv_base = ::File.expand_path('..', node['harstorage']['virtualenv-directory'])
directory venv_base do
  recursive true
  owner node['harstorage']['owner']
  group node['harstorage']['owner']
end

python_virtualenv node['harstorage']['virtualenv-directory'] do
  owner  node['harstorage']['owner']
  group  node['harstorage']['owner']
  options '--system-site-packages'
  action :create
end

python_pip 'setuptools' do
  virtualenv node['harstorage']['virtualenv-directory']
  action :upgrade
  user   node['harstorage']['owner']
  group  node['harstorage']['owner']
end

node['harstorage']['pips'].each do |pp, ver| 
  python_pip pp do
    virtualenv node['harstorage']['virtualenv-directory']
    version ver
    user   node['harstorage']['owner']
    group  node['harstorage']['owner']
    action :install
  end
end

# Install supervisor & dependencies manually
python_pip 'meld3' do
  action :upgrade
end
python_pip 'supervisor' do
  options '--no-deps'
  version node['supervisor']['version'] if node['supervisor']['version']
  action :upgrade
end
include_recipe 'supervisor::default'
