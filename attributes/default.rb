default['harstorage']['pips'] = {
  'pylons'  => '1.0',
  'webob'   => '0.9.8',
  'pymongo' => '2.8',
  # 'harstorage' => 'latest'
}

case node['platform_family']
when 'debian'
  default['harstorage']['packages'] = %w[
    lib32stdc++6
    python
    python-cairo
    python-rsvg
    python-setuptools
    python-pastescript
  ]
when 'rhel', 'fedora'
  default['harstorage']['packages'] = %w[mongodb python pycairo gnome-python2-rsvg python-setuptools]
else
  default['harstorage']['packages'] = %w[]
end

default['harstorage']['owner'] = 'www-data'
default['harstorage']['code-directory'] = '/var/www/harstorage'
default['harstorage']['egg-source'] = 'https://code.google.com/p/harstorage/downloads/detail?name=harstorage-1.0-py2.7.egg&can=2&q='
default['harstorage']['source-repository'] = 'https://github.com/pavel-paulau/harstorage.git'
default['harstorage']['virtualenv-directory'] = '/var/virtualenvs/harstorage'
default['harstorage']['virtualenv-activate'] = File.join(node['harstorage']['virtualenv-directory'], '/bin/activate')
default['harstorage']['virtualenv-python'] = File.join(node['harstorage']['virtualenv-directory'], '/bin/python2.7')
default['harstorage']['virtualenv-pip'] = File.join(node['harstorage']['virtualenv-directory'], '/bin/pip')
default['harstorage']['virtualenvhelper'] = '/var/virtualenvhelper.sh'
default['harstorage']['ini'] = '/etc/harstorage.ini'
default['harstorage']['logfile'] = '/var/log/harstorage.log'
default['harstorage']['.'] = ''

default['harstorage']['supervisor']['command'] = [
  node['harstorage']['virtualenvhelper'],
  node['harstorage']['virtualenv-activate'],
  node['harstorage']['virtualenv-python'],
  '/usr/bin/paster serve',
  node['harstorage']['ini'],
  '--log-file',
  node['harstorage']['logfile']
].join(' ')
