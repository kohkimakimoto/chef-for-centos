#
# = MySQL
#

#
# Package install
#
execute "yum install mysql" do
  command "yum install -y --enablerepo=remi,epel mysql mysql-server mysql-libs"
  not_if "rpm -q mysql"
end

#
# chkconfig
#
execute "chkconfig mysqld on" do
  command "chkconfig mysqld on"
end

#
# Configuration files
#
template "/etc/my.cnf" do
  source "my.cnf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[mysqld]"
end

#
# Command
#
service "mysqld" do
  stop_command    "/etc/init.d/mysqld stop"
  start_command   "/etc/init.d/mysqld start"
  restart_command "/etc/init.d/mysqld restart"
  action :nothing
end
