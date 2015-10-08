ops-nginx Cookbook
==================
Wrapper cookbook for nginx and hhvm

Requirements
------------
### Cookbooks
The following cookbooks are direct dependencies.

```
depends 'nginx', '~> 2.7.6'
depends 'hhvm', '~> 0.6.0'
```

Attributes
----------
none

Usage
-----
#### ops-nginx::default

Installs nginx and disables the default site

```
## Install nginx
include_recipe 'ops-nginx'
```

#### ops-nginx::hhvm

Installs hhvm

```
## Install nginx and hhvm
include_recipe 'ops-nginx'
include_recipe 'ops-nginx::hhvm'
```

Resources Overview
------------------
### ops_nginx_hhvm_site 

Deploys a new nginx config for an hhvm enabled site.

#### Example
```ruby
ops_nginx_hhvm_site 'mysite' do
  port 80
  root '/var/www'
end
```

#### Parameters

- Resource name - A string injected into the filename of the config file, as "`<name`>.conf"

- `root` - root directory of the web site. Defaults to '/var/www'

- `port` - listen port for the nginx instance. Defaults to 80

#### Actions

- `:create` - Deploys the config and reloads the nginx service


### ops_nginx_sudo 

Grants a group sudo access to run process control nginx commands as root. Does not yet grant the same for hhvm.

#### Example
```ruby
ops_nginx_sudo 'ops' do
  group 'ops'
end
```

#### Parameters

- Resource name - A string injected into the filename of the sudoers file, as "/etc/sudoers.d/`<name`>_ops-nginx". Must not contain a "." (dot) or end with a "~" tilde. See the sudoers man page for a full explanation.

- `group` - group granted 

#### Actions

- `:create` - Deploys the sudoers file
