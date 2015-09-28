# Browsermob does not ship a prebuilt package.
# In order to install browsermob, you need to follow instructions
# at the source: https://github.com/lightbody/browsermob-proxy
# Then hose this file somewhere and override the 'source' attribute:
default['harstorage']['browsermob']['source'] = ''
default['harstorage']['browsermob']['install-directory'] = node['harstorage']['code-directory']
# download & install deb
default['harstorage']['browsermob']['download-location'] = ::File.join(
  node['harstorage']['browsermob']['install-directory'], 'browsermob-proxy.deb')
default['harstorage']['browsermob']['jre-package'] = 'default-jre'

default['harstorage']['browsermob']['supervisor']['command'] =
        '/usr/local/bin/browsermob-proxy --port=9090'
