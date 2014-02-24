# vbguest Plugin
script "install-vagrant-vbguest" do
  interpreter "bash"
  code <<-EOH
    vagrant plugin install vagrant-vbguest
  EOH
end
