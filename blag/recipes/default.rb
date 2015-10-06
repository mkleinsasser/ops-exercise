#
# Cookbook Name:: blag
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'ops-mysql'

include_recipe 'blag::nginx'
