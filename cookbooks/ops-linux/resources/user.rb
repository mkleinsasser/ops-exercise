#
# Cookbook Name:: ops-linux
# Resource:: user
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


actions :create
default_action(:create)


attribute :uid, :kind_of => Integer, :required => true
attribute :comment, :kind_of => String, :regex => /.*/, :default => nil

