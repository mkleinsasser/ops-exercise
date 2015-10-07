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
default['mysql_port'] = 3306
default['mysql_root_pass'] = 'never2BeWerkin!'


# wordpress
default['wordpress']['version'] = '4.3.1'
set['wordpress']['dir'] = node['http_root']

set['wordpress']['db']['host'] = 'localhost'
set['wordpress']['db']['port'] = node['mysql_port']
set['wordpress']['db']['mysql_version'] = node['mysql_version']
set['wordpress']['db']['instance_name'] = node['mysql_instance']
set['wordpress']['db']['root_password'] = node['mysql_root_pass']
