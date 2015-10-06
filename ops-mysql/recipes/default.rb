#
# Cookbook Name:: ops-mysql
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

mysql_service 'blag' do
  port '3306'
  version '5.6'
  initial_root_password 'never2BeWerkin!'
  action [:create, :start]
end
