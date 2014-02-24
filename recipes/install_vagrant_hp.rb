# HP Plugin
script "install-vagrant-hp" do
  interpreter "bash"
  code <<-EOH
    vagrant plugin install vagrant-hp --plugin-version #{node['vagrant']['hp_plugin']['version']}
    vagrant box add dummy https://github.com/mohitsethi/vagrant-hp/raw/master/dummy_hp.box
    sed -i "s/1.15/1.18/" /root/.vagrant.d/gems/specifications/vagrant-hp-#{node['vagrant']['hp_plugin']['version']}.gemspec
  EOH
end
