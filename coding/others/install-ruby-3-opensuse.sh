# onliner usage:
# bash <(curl -s https://gist.githubusercontent.com/makevoid/2be2170f17801c761aadfe7d9978b003/raw/fef3435e36729fc46d34c3b3d46c13cfa3b32b9b/install-ruby-3-debian.sh)

set -xe

zypper update -y

zypper install -y \
    git cmake wget curl ca-certificates libyaml-devel \
    automake libtool libzlcore-dev openssl

mkdir -p ~/tmp

cd ~/tmp

wget https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.3.tar.xz

tar -xvf ruby-3.0.3.tar.xz

cd ruby-3.0.3/

./configure

make

make install

gem i -N bundler
