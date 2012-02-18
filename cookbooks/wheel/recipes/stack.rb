# -*- mode: ruby -*-
# # vi: set ft=ruby :
#
# Cookbook Name:: wheel
# Recipe:: stack 
#

include_recipe "git::default"
include_recipe "mysql::server"
include_recipe "rabbitmq::default"

# fixes CHEF-1699
ruby_block "reset group list" do
    block do
        Etc.endgrent
    end                
    action :nothing
end

user node[:wheel][:username] do
    comment "Wheel User"
    home "/home/#{node[:wheel][:username]}"
    shell "/bin/bash"
    notifies :create, "ruby_block[reset group list]", :immediately
end

directory "/home/#{node[:wheel][:username]}" do
    owner node[:wheel][:username]
    group node[:wheel][:username]
    mode "0755"
    action :create
end

directory "/home/#{node[:wheel][:username]}/.ssh" do
    owner node[:wheel][:username]
    group node[:wheel][:username]
    mode "0755"
    action :create
end

cookbook_file "/home/#{node[:wheel][:username]}/.ssh/config" do
    source "config"
    owner node[:wheel][:username]
    group node[:wheel][:username]
    action :create_if_missing
end

cookbook_file "/home/#{node[:wheel][:username]}/.ssh/id_rsa" do
    source "id_rsa"
    owner node[:wheel][:username]
    group node[:wheel][:username]
    mode "0600"
    action :create_if_missing
end

cookbook_file "/home/#{node[:wheel][:username]}/.ssh/id_rsa.pub" do
    source "id_rsa.pub"
    owner node[:wheel][:username]
    group node[:wheel][:username]
    action :create_if_missing
end

git "/home/#{node[:wheel][:username]}/devstack" do
    repository node[:stack][:repository_url]
    reference "master"
    action :sync
    user node[:wheel][:username]
end

cookbook_file "/home/#{node[:wheel][:username]}/devstack/localrc" do
    source "localrc"
    owner node[:wheel][:username]
    group node[:wheel][:username]
    action :create_if_missing
end

execute "./stack.sh" do
    user node[:wheel][:username]
    environment ({"HOME" => "/home/#{node[:wheel][:username]}"})
    cwd "/home/#{node[:wheel][:username]}/devstack"
    not_if {File.exists?("/opt/stack/devstack")}
end

