blag Cookbook
==================
Installs a wordpress blag

Requirements
------------
### Cookbooks
The following cookbooks are direct dependencies.

```
depends 'wordpress', '~> 3.0.0'
depends 'ops-linux', '~> 1.0.0'
depends 'ops-mysql', '~> 1.0.0'
depends 'ops-nginx', '~> 1.0.0'
```

Attributes
----------

#### blag::default
See `attributes/default.rb`.

- `node['http_root']` - Location to place WordPress files
- `node['port']` - Port for nginx to listen on
- `node['mysql_instance']` - Name of the MySQL instance to use with MySQL 
- `node['mysql_version']` - Version of MySQL to install
- `node['mysql_host']` - Host of the WordPress MySQL database
- `node['mysql_port']` - Port of the WordPress MySQL database
- `node['wordpress']['version']` - Version of WordPress to download


Usage
-----
#### blag::default
Include the recipe either in the node's run_list, or in the recipe of an application that requires it.

blag/recipes/default.rb:
```
# uses blag
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
