#
# = PHP
#

#
# Package install
#
execute "yum install php" do
  command "yum install -y --enablerepo=remi,epel php php-common php-mbstring php-xml php-gd php-devel php-process php-cli php-pear"
  not_if "rpm -q php"
end

execute "yum install grep php-mysql" do
  command "yum install -y --enablerepo=remi,epel php-mysql"
  not_if "rpm -q php-mysql"
end

execute "yum install php-pecl-apc" do
  command "yum install -y --enablerepo=remi,epel php-pecl-apc"
  not_if "rpm -q php-pecl-apc"
end

#
# Configration files
#
template "/etc/php.ini" do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[httpd]"
end

template "/etc/php.d/apc.ini" do
  source "apc.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[httpd]"
end
