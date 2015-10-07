#
# Cookbook Name:: blag
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'blag::mysql'
include_recipe 'blag::nginx'
include_recipe 'blag::wordpress'
