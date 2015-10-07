#
# Cookbook Name:: blag
# Attributes:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

default['http_root'] = '/var/www'
default['port'] = 80

default['mysql_instance'] = 'blag'
default['mysql_version'] = '5.6'
default['mysql_port'] = 3306
default['mysql_root_pass'] = 'never2BeWerkin!'

default['wordpress']['version'] = '4.3.1'
default['wordpress']['dir'] = '/var/www'

set['wordpress']['db']['mysql_version'] = node['mysql_version']
set['wordpress']['dir'] = node['http_root']

## When db.host is some variation of "localhost" then
## the wordpress cookbook forcibly installs mysql-server.
## This is presently the only way to override it.
set['wordpress']['db']['host'] = node['hostname']
