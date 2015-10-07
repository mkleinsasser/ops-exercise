#
# Cookbook Name:: blag
# Recipe:: mysql
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


mysql_creds = data_bag_item('creds', 'mysql')


ops_mysql_service 'blag' do
  version node.mysql_version
  port    node.mysql_port

  root_pass mysql_creds['root']
end
