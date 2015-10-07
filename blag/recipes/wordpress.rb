#
# Cookbook Name:: blag
# Recipe:: wordpress
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


## The default wordpress recipe installs apache. Don't use it!
include_recipe 'wordpress::app'
