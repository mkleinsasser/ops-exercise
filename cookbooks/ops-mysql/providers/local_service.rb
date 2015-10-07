#
# Cookbook Name:: ops-mysql
# Provider:: local_service
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


action :create do

  mysql_service new_resource.name do
    bind_address '127.0.0.1'
    port    new_resource.port
    version new_resource.version
    initial_root_password new_resource.root_pass
    action [:create, :start]
  end

end
