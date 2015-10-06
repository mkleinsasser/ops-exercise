#
# Cookbook Name:: blag
# Attributes:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

default['wordpress']['version'] = '4.3.1'
default['wordpress']['dir'] = '/var/www'
default['wordpress']['db']['mysql_version'] = '5.6'

## When db.host is some variation of "localhost" then
## the wordpress cookbook forcibly installs mysql-server.
## This is presently the only way to override it.
set['wordpress']['db']['host'] = node['hostname']

