#
# = iptables
#

#
# Package install
#
package "iptables" do
  action :install
  not_if "rpm -q iptables"
end

#
# Command
#
service "iptables" do
  stop_command    "/etc/init.d/iptables stop"
  start_command   "/etc/init.d/iptables start"
  restart_command "/etc/init.d/iptables restart"
  action :nothing
end

#
# Configuration files
#
template "/etc/sysconfig/iptables" do
  source "iptables.erb"
  owner "root"
  group "root"
  mode "0600"
  notifies :restart, "service[iptables]"
end

