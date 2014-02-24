case node['platform']
when "centos"
  %w{
    libxml2 libxml2-devel libxslt libxslt-devel
  }.each do |package_name|
    package "#{package_name}" do
      action :install
    end
  end
end

git "/usr/local/src/vagrant-vsphere" do
  repository "git://github.com/nsidc/vagrant-vsphere.git"
  reference "master"
  action :sync
end

cookbook_file "/usr/local/src/vagrant-vsphere/vSphere.gemspec" do
  source "vSphere.gemspec"
end

script "build-gemspec" do
  interpreter "bash"
  user "root"
  cwd "/usr/local/src/vagrant-vsphere"
  code <<-EOH
    gem build vSphere.gemspec
  EOH
end

script "install-vagrant-vsphere" do
  interpreter "bash"
  user "root"
  cwd "/usr/local/src/vagrant-vsphere"
  code <<-EOH
    vagrant plugin install vagrant-vsphere
  EOH
end
