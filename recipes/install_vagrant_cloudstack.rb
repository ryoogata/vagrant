# Cloudstack Plugin
script "install-vagrant-cloudstack" do
  interpreter "bash"
  code <<-EOH
    vagrant plugin install vagrant-cloudstack
    vagrant plugin install inifile
    vagrant box add dummy https://github.com/klarna/vagrant-cloudstack/raw/master/dummy.box
  EOH
end

# python-pip のインストール
case node['platform']
when "centos","ubuntu"
  package "python-pip" do
  action :install
  end
end


# pip のインストール
easy_install_package "pip" do
        action :install
end


# pip 経由の cloudmonkey インストール
execute "pip install" do
        command "/usr/bin/pip install cloudmonkey"
end

