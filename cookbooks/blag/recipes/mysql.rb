#
# Cookbook Name:: blag
# Recipe:: mysql
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

ops_mysql_service 'blag' do
  version node.mysql_version
  port    node.mysql_port

  root_pass node.mysql_root_pass
end
