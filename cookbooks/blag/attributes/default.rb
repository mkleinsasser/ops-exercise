#
# Cookbook Name:: blag
# Attributes:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


# nginx
default['http_root'] = '/var/www'
default['port'] = 80


# mysql
default['mysql_instance'] = 'blag'
default['mysql_version'] = '5.5'
default['mysql_host'] = 'localhost'
default['mysql_port'] = 3306


# wordpress
default['wordpress']['version'] = '4.3.1'

# copy these from the node config
set['wordpress']['dir'] = node['http_root']
set['wordpress']['db']['host'] = node['mysql_host']
set['wordpress']['db']['port'] = node['mysql_port']
set['wordpress']['db']['mysql_version'] = node['mysql_version']
set['wordpress']['db']['instance_name'] = node['mysql_instance']
