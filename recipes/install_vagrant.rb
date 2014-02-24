#
# Cookbook Name:: vagrant
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# パッケージの Download
case node['platform']
when "centos"
  remote_file "/tmp/vagrant.rpm" do
    if node['kernel']['machine'] == 'x86_64'
      source "https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.2_x86_64.rpm"
    else
      source "https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_i686.rpm"
    end
  end
when "ubuntu" 
  remote_file "/tmp/vagrant.deb" do
    if node['kernel']['machine'] == 'x86_64'
      source "https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.2_x86_64.deb"
    else
      source "https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_i686.deb"
    end
  end
end

# パッケージのインストール
case node['platform']
when "centos"
  package "vagrant" do
    action :install
    source "/tmp/vagrant.rpm"
    provider Chef::Provider::Package::Rpm
  end
when "ubuntu"
  dpkg_package "vagrant" do
    action :install
    source "/tmp/vagrant.deb"
  end
end
