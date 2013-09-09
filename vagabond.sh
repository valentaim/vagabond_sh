apt-get install -y ruby1.9.3
apt-get install -y make
export VAGA_DIR="${HOME}/work/vagabond" && mkdir -p $VAGA_DIR && cd $VAGA_DIR
git clone https://github.com/omgbebebe/vagabond.git
cd vagabond
git checkout scor
gem build vagabond.gemspec
gem install vagabond-0.2.8.gem > /dev/null 2>&1
gem install vagabond-0.2.8.gem > /dev/null 2>&1
cd ../
vagabond init --debug
sed -i '/.*enabled/s/false/true/' Vagabondfile
vagabond server create --debug
vagabond server status
knife cookbook create test -c .chef/knife.rb
echo -e "package 'ntp' do\n\
action :install\n\
end\n" > cookbooks/test/recipes/default.rb
sed -ie '/:nodes=>{:ubuntu1204=>{:template=>"ubuntu_1204".*/s/run_list.*/run_list=>["recipe[test]"]}},/' Vagabondfile
vagabond server upload_cookbooks
vagabond up ubuntu1204 --debug
