#
# Cookbook Name:: ops-mysql
# Provider:: server
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


action :create do

  mysql_service new_resource.name do
    port    new_resource.port
    version new_resource.version
    initial_root_password new_resource.root_pass
    action [:create, :start]
  end

end
