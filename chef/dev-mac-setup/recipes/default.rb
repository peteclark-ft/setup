#
# Cookbook Name:: dev-mac-setup
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory "#{node[:user_home]}/Code/go/utils" do
  owner node[:user_id]
  group node[:group_id]
  recursive true
end

cookbook_file "#{node[:user_home]}/.bash_profile" do
  owner node[:user_id]
  group node[:group_id]
  source '.bash_profile'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.ssh/config" do
  owner node[:user_id]
  group node[:group_id]
  source 'ssh/config'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.ssh/id_rsa" do
  owner node[:user_id]
  group node[:group_id]
  source 'ssh/id_rsa'
  mode '0600'
end

cookbook_file "#{node[:user_home]}/.ssh/id_rsa.pub" do
  owner node[:user_id]
  group node[:group_id]
  source 'ssh/id_rsa.pub'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.ssh/known_hosts" do
  owner node[:user_id]
  group node[:group_id]
  source 'ssh/known_hosts'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.gitconfig" do
  owner node[:user_id]
  group node[:group_id]
  source 'git/.gitconfig'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.gitignore_global" do
  owner node[:user_id]
  group node[:group_id]
  source 'git/.gitignore_global'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.hgignore_global" do
  owner node[:user_id]
  group node[:group_id]
  source 'git/.hgignore_global'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.ft-api-key" do
  owner node[:user_id]
  group node[:group_id]
  source 'gen-utils/.ft-api-key'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.muttrc" do
  owner node[:user_id]
  group node[:group_id]
  source 'mutt/.muttrc'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.muttrc-icloud" do
  owner node[:user_id]
  group node[:group_id]
  source 'mutt/.muttrc-icloud'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.muttrc-hotmail" do
  owner node[:user_id]
  group node[:group_id]
  source 'mutt/.muttrc-hotmail'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/Code/go/utils/run-blog-finder.sh" do
  owner node[:user_id]
  group node[:group_id]
  source 'go-utils/run-blog-finder.sh'
  mode '0744'
end

cookbook_file "#{node[:user_home]}/Code/go/utils/uuids.txt" do
  owner node[:user_id]
  group node[:group_id]
  source 'go-utils/uuids.txt'
  mode '0644'
end
