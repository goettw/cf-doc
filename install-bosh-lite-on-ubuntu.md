Install Ubuntu
==============
I used ubuntu-12.04.3-desktop-amd64 and installed it on VMware Workstation

accepted all updates from update manager




sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
rvm install 2.0.0-p353
rvm use 2.0.0-p353 --default

rvm -v

echo "gem: --no-ri --no-rdoc" > ~/.gemrc


gem install bosh_cli_plugin_micro --pre

mkdir workspace
cd workspace
git clone https://github.com/cloudfoundry/cf-release

vagrant is running on Windows (later changed to bridged mode for network adapter)



wget http://bosh-jenkins-gems-warden.s3.amazonaws.com/stemcells/latest-bosh-stemcell-warden.tgz
bosh upload stemcell latest-bosh-stemcell-warden.tgz
curl -s http://spiff.cfapps.io/install.sh | bash




Install spiff.https://github.com/cloudfoundry-incubator/spiff

git clone https://github.com/cloudfoundry/cf-release
cd ~/workspace/cf-release
./update
git checkout v154

cd ~/workspace/bosh-lite
./scripts/make_manifest_spiff


