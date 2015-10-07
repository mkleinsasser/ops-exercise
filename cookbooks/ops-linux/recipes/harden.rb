#
# Cookbook Name:: ops-linux
# Recipe:: harden
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "ssh-hardening"
include_recipe "os-hardening"

# embarassing workaround because ssh-hardening keeps clobbering my user
execute 'unlock matt' do
  command "usermod -p '*' matt"
end
