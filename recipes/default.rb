#
# Cookbook Name:: collins
# Recipe:: default
#
# Copyright 2013, Bao Nguyen
#
# All rights reserved

include_recipe "java"

# packages needed by collins to build and run
packages = {}
packages.merge!({
  'daemon' => '',
  'mysql-server' => '',
})

packages.each do |pkg_name, pkg_version|
  package pkg_name do
    action :install
    version pkg_version unless pkg_version.empty?
  end
end

# TODO: generate random id for user and group
group node[:collins][:group] do
  gid node[:collins][:gid]
end

# Create the Collins user
user node[:collins][:user] do
  supports :manage_home => true
  comment node[:collins][:app_name]
  uid node[:collins][:uid]
  gid node[:collins][:group]
  home node[:collins][:install_dir]
  shell "/bin/bash"
end

# making directories
directory node[:collins][:install_dir] do
  owner node[:collins][:user]
  group node[:collins][:group]
  mode 00744
  action :create
end

directory "#{node[:collins][:run_dir]}/#{node[:collins][:app_name]}" do
  owner node[:collins][:user]
  group node[:collins][:group]
  mode 00744
  action :create
end

directory "#{node[:collins][:log_dir]}/#{node[:collins][:app_name]}" do
  owner node[:collins][:user]
  group node[:collins][:group]
  mode 00744
  action :create
end

# install the collins binary
tmp_filename = "#{node[:collins][:app_name]}.zip"

remote_file "#{node[:collins][:install_dir]}/#{tmp_filename}" do
  source node[:collins][:url]
  checksum node[:collins][:checksum]
  owner node[:collins][:user]
  group node[:collins][:group]
  mode 0644
end

# rm -rf #{node[:collins][:install_dir]}/#{node[:collins][:app_name]}
# mv #{node[:collins][:install_dir]}/#{node[:collins][:app_name]}/* #{node[:collins][:install_dir]}
bash 'extract_module' do
  user node[:collins][:user]
  group node[:collins][:group]  
  cwd ::File.dirname(node[:collins][:install_dir])
  code <<-EOH
    unzip -o #{node[:collins][:install_dir]}/#{tmp_filename}
    EOH
  not_if { ::File.exists?("#{node[:collins][:conf_dir]}/production.conf") }
end

# collins.sh
directory node[:collins][:scripts_dir] do
  owner node[:collins][:user]
  group node[:collins][:group]
  mode 00755
  action :create
end

# install startup script
template node[:collins][:collins_sh] do
  source "collins.sh.erb"
  owner node[:collins][:user]
  group node[:collins][:group]
  mode 0744
  variables({
    :app_name => node[:collins][:app_name],
    :app_home => node[:collins][:app_home],
    :daemon_bin => node[:collins][:daemon_bin],
    :listen_port => node[:collins][:listen_port],
    :file_limit => node[:collins][:file_limit],
    :user_name => node[:collins][:user],
    :heap_opts => node[:collins][:heap_opts],
    :log_dir => node[:collins][:log_dir],
    :run_dir => node[:collins][:run_dir],     
  })
end