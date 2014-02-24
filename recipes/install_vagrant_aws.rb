# AWS Plugin
script "install-vagrant-aws" do
  interpreter "bash"
  code <<-EOH
    vagrant plugin install vagrant-aws
    vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
  EOH
end
