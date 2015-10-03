# Attributes for the installation of mongodb

case node['platform_family']
when 'debian'
  default['harstorage']['mongo']['packages'] = %w[
    mongodb-org
  ]

  default['harstorage']['mongo']['apt']['keyserver'] = 'keyserver.ubuntu.com'
  default['harstorage']['mongo']['apt']['key'] = '7F0CEB10'
  default['harstorage']['mongo']['apt']['uri'] = 'http://repo.mongodb.org/apt/ubuntu'
  default['harstorage']['mongo']['apt']['distribution'] = "#{node['lsb']['codename']}/mongodb-org/3.0 multiverse"

# TODO: Need to implement multiple distro support
when 'rhel', 'fedora'
  default['harstorage']['mongo'] = %w[]
else
  default['harstorage']['mongo'] = %w[]
end

default['harstorage']['mongo']['data-directory'] = '/var/lib/mongodb'
default['harstorage']['mongo']['conf-file'] = '/etc/mongod.conf'
