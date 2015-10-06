blag Cookbook
==================
Installs blag

Requirements
------------
### Cookbooks
The following cookbooks are direct dependencies.

blag-mysql
blag-nginx
blag-hhvm

Attributes
----------
none

Usage
-----
#### blag::default
Include the recipe either in the node's run_list, or in the recipe of an application that requires it.

blag/recipes/default.rb:
```
# uses mysql
include_recipe "blag"
```

-or-

node run_list:
```json
{
  "name":"my_node",
  "run_list": [
    "recipe[blag]"
  ]
}
```

License and Authors
-------------------
- Author:: Matt Kleinsasser (<mxkx@hotmail.com>)

