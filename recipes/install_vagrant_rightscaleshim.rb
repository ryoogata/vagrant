# RightScaleshim Plugin
script "install-vagrant-rightscaleshim" do
  interpreter "bash"
  code <<-EOH
    vagrant plugin install vagrant-rackspace --plugin-version #{node['vagrant']['rightscaleshim_plugin']['version']}
    vagrant box add ri_centos6.4_v5.8.8 https://s3.amazonaws.com/rgeyer/pub/ri_centos6.4_v5.8.8_vagrant.box
  EOH
end
