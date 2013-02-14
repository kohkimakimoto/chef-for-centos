# Chef for CentOS

Sample chef repository and installation steps document for CentOS6.
You don't use chef-server. You only use chef-solo and git.

# Uage

Following will build your CentOS sever environment in easy several steps.

1. Install CentOS.

1. Modify your host name.

        # vi /etc/sysconfig/network

    You need to edit like following.

        NETWORKING=yes
        HOSTNAME=web

1. Reboot to use modified hostname.

        # reboot

1. Install chef using Omnibus. You only run below command.

        # curl -L https://www.opscode.com/chef/install.sh | bash

  Omunibus is installer of chef packaging. more infomation is to see
  `http://www.opscode.com/blog/2012/06/29/omnibus-chef-packaging/`.

1. Install git

        # yum install -y git

1. Clone the git repository

        # git clone https://github.com/kohkimakimoto/chef-for-centos.git /var/chef

1. Run chef-solo using following command

        # sh /var/chef/bin/chef-host


