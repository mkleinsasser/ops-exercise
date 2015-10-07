#
# Cookbook Name:: ops-linux
# Recipe:: users
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


# user accounts group
group node.ops_linux.ops_group do
  gid node.ops_linux.ops_gid
end

ops_linux_user 'matt' do
  uid 10001
  comment 'Matt Kleinsasser'
end

