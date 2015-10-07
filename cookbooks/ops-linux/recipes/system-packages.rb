#
# Cookbook Name:: ops-linux
# Recipe:: system_packages
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


# install system packages
%w{
    vim
    curl
  }.each do |pkg|
  package pkg
end

