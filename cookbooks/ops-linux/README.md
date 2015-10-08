ops-linux Cookbook
==================
Wrapper cookbook for linux policies

Requirements
------------
### Cookbooks
The following cookbooks are direct dependencies.

```
depends 'os-hardening', '~> 1.3.1'
depends 'ssh-hardening', '~> 1.1.0'
```

Attributes
----------
#### ops-linux::default
See `attributes/default.rb`.

- `node['ops_linux']['ops_group']` - Name of the operations group
- `node['ops_linux']['ops_gid']` - Group ID of the operations group

Usage
-----
#### ops-linux::default

Applies baseline linux system configuration including simple packages installs and user/group creation.

```
include_recipe 'ops-linux::default'
```

#### ops-linux::harden

Applies hardening configuration. This should always be done last.

```
run_list:
  - recipe[mysite::default]
  - recipe[ops-linux::harden]
```
