# Digital Ocean Plugin
script "install-vagrant-digitalocean" do
  interpreter "bash"
  code <<-EOH
    vagrant plugin install vagrant-digitalocean
  EOH
end
