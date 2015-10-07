#
# Cookbook Name:: blag
# Recipe:: wordpress
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


## wordpress::default installs Apache, which we don't want
include_recipe 'wordpress::app'


