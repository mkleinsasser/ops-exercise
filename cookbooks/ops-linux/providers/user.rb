#
# Cookbook Name:: ops-linux
# Provider:: user
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


action :create do

  home    = "/home/#{new_resource.name}"
  dot_ssh = "#{home}/.ssh"
  
  # user account
  user       new_resource.name do
    uid      new_resource.uid
    gid      node.ops_linux.ops_group 
    home     "#{home}"
    shell    "/bin/bash"
    comment  new_resource.comment
    supports :manage_home => true
  end

  # usergroup for user account
  group     new_resource.name do
    gid     new_resource.uid
    members new_resource.name
  end
  
  # .ssh
  directory dot_ssh do
    owner new_resource.name
    group new_resource.name
    mode "0700"
  end
  
  # drop public key(s)
  template "#{dot_ssh}/authorized_keys" do
    cookbook "ops-linux"
    source "authorized_keys/#{new_resource.name}.erb"
    action :create_if_missing
    owner  new_resource.name
    group  new_resource.name
    mode   "0600"
    backup false
  end
  
  # disable password
  user       new_resource.name do
    action   :lock
  end
  
end
