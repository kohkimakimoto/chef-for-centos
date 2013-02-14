#
# = httpd
#

#
# Package install
#
package "httpd" do
  action :install
  not_if "rpm -q httpd"
end

package "mod_ssl" do
  action :install
  not_if "rpm -q mod_ssl"
end

#
# chkconfig
#
execute "chkconfig httpd on" do
  command "chkconfig httpd on"
end

#
# command
#
service "httpd" do
  stop_command    "/etc/init.d/httpd stop"
  start_command   "/etc/init.d/httpd start"
  restart_command "/etc/init.d/httpd graceful"
  action :nothing
end

#
# Configration files
#
# httpd.conf
template "/etc/httpd/conf/httpd.conf" do
  source "conf/httpd.conf.erb"
  owner "root"
  group "root"
  mode "0664"
  notifies :restart, "service[httpd]"
end
