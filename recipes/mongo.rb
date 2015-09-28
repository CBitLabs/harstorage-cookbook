case node['platform_family']
when 'debian'
  include_recipe 'harstorage::mongo_debian'
  # TODO : other platform install
end
