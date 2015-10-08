ops-mysql Cookbook
==================
Wrapper cookbook for mysql

Requirements
------------
### Cookbooks
The following cookbooks are direct dependencies.

```
depends 'mysql', '~> 6.1.2'
```

Attributes
----------
none

Resources Overview
------------------
### ops_mysql_local_service 

Installs an instance of mysql_service that listens only on localhost (127.0.0.1).

#### Example
```ruby
ops_mysql_local_service 'mydb' do
  version '5.5'
  port    3306
  root_pass 'change me'
end
```

#### Parameters

See the mysql community cookbook for a full description of mysql_service options.

- Resource name - A string to identify the MySQL service. Directories
  and files on disk are named `mysql-<name>`.

- `root_pass` - the initial root password for mysql when initializing new databases. Passed to mysql_service:initial_root_password.

- `port` - listen port for the mysql instance. Defaults to 3306

- `version` - mysql version. Defaults to '5.5'

#### Actions

- `:create` - Configures everything and starts the service
