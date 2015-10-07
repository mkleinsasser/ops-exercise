#
# Cookbook Name:: ops-nginx
# Resource:: sudo
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


actions :create

default_action(:create)

attribute :group, :kind_of => String, :default => nil
