#
# Selinux
#

#
# Configuration files
#
template "/etc/selinux/config" do
 source "config.erb"
  owner "root"
  group "root"
  mode "0644"
end

execute "selinux setenforce 0" do
  command "setenforce 0"
  only_if "getenforce | grep Enforcing"
end
