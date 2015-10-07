#
# Cookbook Name:: ops-nginx
# Resource:: site
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


actions :create

default_action(:create)

attribute :root, :kind_of => String, :default => '/var/www'
attribute :port, :kind_of => Fixnum, :default => 80
