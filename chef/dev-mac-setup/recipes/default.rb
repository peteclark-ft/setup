#
# Cookbook Name:: dev-mac-setup
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory "#{node[:user_home]}/Code/go/utils" do
  recursive true
end

cookbook_file "#{node[:user_home]}/.bash_profile" do
  source '.bash_profile'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.ssh/config" do
  source 'ssh/config'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.ssh/id_rsa" do
  source 'ssh/id_rsa'
  mode '0600'
end

cookbook_file "#{node[:user_home]}/.ssh/id_rsa.pub" do
  source 'ssh/id_rsa.pub'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.ssh/known_hosts" do
  source 'ssh/known_hosts'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.gitconfig" do
  source 'git/.gitconfig'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.gitignore_global" do
  source 'git/.gitignore_global'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.hgignore_global" do
  source 'git/.hgignore_global'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.ft-api-key" do
  source 'gen-utils/.ft-api-key'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/.muttrc" do
  source '.muttrc'
  mode '0644'
end

cookbook_file "#{node[:user_home]}/Code/go/utils/run-blog-finder.sh" do
  source 'go-utils/run-blog-finder.sh'
  mode '0744'
end

cookbook_file "#{node[:user_home]}/Code/go/utils/uuids.txt" do
  source 'go-utils/uuids.txt'
  mode '0644'
end

bash 'run_setup' do
  cwd "#{node[:user_home]}/Code/setup"
  code './setup.sh'
end
