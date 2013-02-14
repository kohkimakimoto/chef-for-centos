#
# = Linux common packages
#

#
# Package install
#

package "wget" do
  action :install
  not_if "rpm -q wget"
end

package "bind-utils" do
  action :install
  not_if "rpm -q bind-utils"
end

package "traceroute" do
  action :install
  not_if "rpm -q traceroute"
end

package "man" do
  action :install
  not_if "rpm -q man"
end

package "crontabs" do
  action :install
  not_if "rpm -q crontabs"
end

package "gcc" do
  action :install
  not_if "rpm -q gcc"
end

package "make" do
  action :install
  not_if "rpm -q make"
end

package "gettext" do
  action :install
  not_if "rpm -q gettext"
end

package "rpm-build" do
  action :install
  not_if "rpm -q rpm-build"
end

package "tcpdump" do
  action :install
  not_if "rpm -q tcpdump"
end


#
# chkconfig
#
execute "chkconfig crond on" do
  command "chkconfig crond on"
end
