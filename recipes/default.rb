#
# Cookbook Name:: harstorage
# Recipe:: default
#
# Copyright (C) 2015 BitSight Technologies
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'harstorage::mongo'
include_recipe 'harstorage::install'
include_recipe 'harstorage::browsermob'
