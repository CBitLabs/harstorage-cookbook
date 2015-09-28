
if node['harstorage']['browsermob']['source']

  package node['harstorage']['browsermob']['jre-package']  do
    action :install
  end

  remote_file node['harstorage']['browsermob']['download-location'] do
    source node['harstorage']['browsermob']['source']
  end

  dpkg_package 'browsermob-proxy' do
    source node['harstorage']['browsermob']['download-location']
    action :install
  end

  supervisor_service 'browsermob' do
    command node['harstorage']['browsermob']['supervisor']['command']
  end

else
  log 'NoBrowserMobSource' do
    message 'browsermob source not specified, skipping install'
  end
end
