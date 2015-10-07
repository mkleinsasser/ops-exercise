#
# Cookbook Name:: ops-mysql
# Resource:: local_service
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


actions :create

default_action(:create)

attribute :port, :kind_of => Fixnum, :default => 3600
attribute :version, :kind_of => String, :default => '5.5'
attribute :root_pass, :kind_of => String, :default => nil
