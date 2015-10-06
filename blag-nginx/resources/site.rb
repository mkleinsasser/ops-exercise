#
# Cookbook Name:: blag-nginx
# Resource:: site
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


actions :create

default_action(:create)

attribute :port, :kind_of => Fixnum
attribute :root, :kind_of => String

attribute :root, :kind_of => String, :default => '/var/www'
attribute :port, :kind_of => Fixnum, :default => 80
