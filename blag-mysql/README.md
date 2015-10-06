blag-mysql Cookbook
==================
Installs mysql with policy customizations for blag.  See the mysql cookbook for general mysql requirements.

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
#### blag-mysql::default
Include the recipe either in the node's run_list, or in the recipe of an application that requires it.

blag/recipes/default.rb:
```
# uses mysql
include_recipe "blag-mysql"
```

-or-

node run_list:
```json
{
  "name":"my_node",
  "run_list": [
    "recipe[blag-mysql]"
  ]
}
```

License and Authors
-------------------
- Author:: Matt Kleinsasser (<mxkx@hotmail.com>)

