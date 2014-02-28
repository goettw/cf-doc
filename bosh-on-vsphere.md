# Deploy Microbosh

##Prepare VSPHERE
* Turn on DRS on the cluster, add resource-pool

## On client (in my case ubuntu)

```
$ bosh download public stemcell bosh-stemcell-1868-vsphere-esxi-ubuntu.tgz
$ sudo apt-get -y install libsqlite3-dev genisoimage
$ sudo apt-get update
$ sudo apt-get install curl
$ \curl -L https://get.rvm.io | bash -s stable
$ source ~/.rvm/scripts/rvm
$ rvm requirements
$ rvm install ruby-2.0
$ rvm use ruby --default
$ rvm rubygems current
$ gem install bosh_cli --pre
$ gem install bosh_cli_plugin_micro --pre
$ mkdir deployments
$ cd deployments/
$ mkdir micro01
$ cd micro01/
```
Now, copy [micro bosh manifest](templates/micro_bosh.yml) to this location
```
$ cd ..
$ bosh download public stemcell bosh-stemcell-1868-vsphere-esxi-ubuntu.tgz
$  bosh micro deployment micro01/micro_bosh.yml
$ bosh micro deploy bosh-stemcell-1868-vsphere-esxi-ubuntu.tgz
```

# Deploy Cloudfoundry
## bosh-cloudfoundry
[My version, including vsphere support](https://github.com/goettw/bosh-cloudfoundry)

#Install CF Client
http://docs.cloudfoundry.org/devguide/installcf/
```
$ mkdir gcf
$ wget https://github.com/cloudfoundry/cli/releases/download/v6.0.1/cf-linux-amd64.tgz
$ tar xzf cf-linux-amd64.tgz
$ sudo mv cf /usr/local/bin/
```
# Troubleshooting
## microbosh ssh login

```
$ ssh vcap@<microbosh director ip-address>
$ password "c1oudc0w"
```
