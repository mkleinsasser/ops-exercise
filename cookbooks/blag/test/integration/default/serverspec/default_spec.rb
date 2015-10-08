require 'spec_helper'


## Data tier

describe service('mysql') do
  it { should be_running }
end

describe port(3306) do
  it { should be_listening.on('127.0.0.1').with('tcp') }
end


## Web tier

describe service('hhvm') do
  it { should be_running }
end

describe service('nginx') do
  it { should be_running }
end

describe port(80) do
  it { should be_listening.on('0.0.0.0').with('tcp') }
end


## Functional test

describe package('curl') do
  it { should be_installed }
end

describe command('curl --head http://localhost/wp-admin/install.php') do
  its(:stdout) { should match /HTTP\/1.1 200 OK/ }
  its(:stdout) { should match /Server: nginx/ }
  its(:stdout) { should match /X-Powered-By: HHVM/ }
end


## Users / Groups

describe group('ops') do
  it { should exist }
end

describe user('matt') do
  it { should belong_to_group 'ops' }
end

# Test process control grant to the ops group
describe command('sudo su - matt -c "sudo /usr/sbin/nginx -t"') do
  its(:stderr) { should match /nginx.conf syntax is ok/ }
  its(:stderr) { should match /nginx.conf test is successful/ }
end
