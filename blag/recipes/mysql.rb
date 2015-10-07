#
# Cookbook Name:: blag
# Recipe:: mysql
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

ops_mysql_service 'blag' do
  port node.mysql_port
  version node.mysql_version
  root_pass node.mysql_root_pass
end
