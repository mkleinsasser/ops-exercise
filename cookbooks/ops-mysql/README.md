ops-mysql Cookbook
==================
Installs mysql with policy customizations for ops.  See the mysql cookbook for general mysql requirements.

Requirements
------------
### Cookbooks
The following cookbooks are direct dependencies.

mysql

Attributes
----------
none

Usage
-----
#### ops-mysql::default
Include the recipe either in the node's run_list, or in the recipe of an application that requires it.

blag/recipes/default.rb:
```
# uses mysql
include_recipe "ops-mysql"
```

-or-

node run_list:
```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ops-mysql]"
  ]
}
```

License and Authors
-------------------
- Author:: Matt Kleinsasser (<mxkx@hotmail.com>)

