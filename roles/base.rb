name "base"
description ""
run_list(
  "recipe[common]",
  "recipe[selinux]",
  "recipe[yum]",
  "recipe[httpd]",
  "recipe[php]",
  "recipe[mysql]"
)

default_attributes({
  :role                => "base",
})
