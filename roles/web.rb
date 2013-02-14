name "web"
description ""
run_list(
  "role[base]"
)

default_attributes({
  :role                => "web",
})