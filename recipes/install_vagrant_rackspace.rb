# Rackspace Plugin
script "install-vagrant-rackspace" do
  interpreter "bash"
  code <<-EOH
    vagrant plugin install vagrant-rackspace --plugin-version #{node['vagrant']['rackspace_plugin']['version']}
    vagrant box add dummy https://github.com/mitchellh/vagrant-rackspace/raw/master/dummy.box
    sed -i "s/1.15/1.18/" /root/.vagrant.d/gems/specifications/vagrant-rackspace-#{node['vagrant']['rackspace_plugin']['version']}.gemspec
  EOH
end
