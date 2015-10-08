source 'https://supermarket.chef.io'

## Berksfile for vagrant
## kitchen uses a seperate Berksfile in cookbooks/blag/Berksfile alongside .kitchen.yml

cookbook 'blag', '~> 1.0.0', path: 'cookbooks/blag'

## Wrapper cookbooks
cookbook 'ops-linux', '~> 1.0.0', path: 'cookbooks/ops-linux'
cookbook 'ops-mysql', '~> 1.0.0', path: 'cookbooks/ops-mysql'
cookbook 'ops-nginx', '~> 1.0.0', path: 'cookbooks/ops-nginx'

## mysql dependencies
cookbook 'mysql', '~> 6.1.2'

## web tier dependencies
cookbook 'nginx', '~> 2.7.6'
cookbook 'hhvm', '~> 0.6.0'
cookbook 'wordpress', '~> 3.0.0'

## linux wrapper dependencies
cookbook 'ssh-hardening', '~> 1.1.0'
cookbook 'os-hardening', '~> 1.3.1'
