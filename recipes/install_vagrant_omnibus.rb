# omnibus Plugin
script "install-vagrant-omnibus" do
  interpreter "bash"
  code <<-EOH
    vagrant plugin install vagrant-omnibus
  EOH
end
