#
# Cookbook Name:: ops-linux
# Recipe:: harden
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "ssh-hardening"
include_recipe "os-hardening"

# unlock me after hardening
user 'matt' do
  :unlock
end
