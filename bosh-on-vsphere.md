# Deploy Microbosh

##Prepare VSPHERE
* Turn on DRS on the cluster, add resource-pool

## On client (in my case ubuntu)

```
$ rvm use ruby-2.0
$ sudo apt-get install libxslt-dev libxml2-dev
$ gem install bosh-bootstrap
```
bosh-bootstrap bug: https://github.com/cloudfoundry-community/cyoi/blob/master/lib/cyoi/cli/providers/provider_cli_vsphere.rb -> fix line 23 in

```
$ vi ~/.rvm/gems/ruby-2.1.0/gems/cyoi-0.8.0/lib/cyoi/cli/providers/provider_cli_vsphere.rb
: 23
```
move cursor to h1 and change it to hl by typing cw (change word in vi) in hl. 
```
cwhl
SHIFT+ZZ
```
now start deployment of microbosh
```
$ bosh-bootstrap deploy
```

# Deploy Cloudfoundry
## bosh-cloudfoundry
[My version, including vsphere support](https://github.com/goettw/bosh-cloudfoundry)
# Troubleshooting
## microbosh ssh login

```
$ ssh vcap@<microbosh director ip-address>
$ password "c1oudc0w"
```


