#
# Cookbook Name:: blag
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

## Install the full stack on the local node
include_recipe 'ops-linux::default'
include_recipe 'blag::mysql'
include_recipe 'blag::nginx'
include_recipe 'blag::wordpress'
