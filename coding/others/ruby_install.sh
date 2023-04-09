


... install ruby in mac
... option 1:

brew install rbenv ruby-build

# bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile  

# zsh
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zprofile
echo 'eval "$(rbenv init -)"' >> ~/.zprofile  

# list all available versions:
rbenv install -l

# install a Ruby version:
rbenv install 2.4.1

# set ruby version for a specific dir
rbenv local 2.4.1

# set ruby version globally
rbenv global 2.4.1

rbenv rehash
gem update --system

... 
... option 2:
... brew install ruby
... 
... the newest version of the ruby might not get activated
... as in mac there is another version is already installed.
... you need to do following to activated your new version.
...

echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.zshrc

... For compilers to find ruby you may need to set:
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

... For pkg-config to find ruby you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

... 
... install ruby in debian:
bash <(curl -s https://gist.githubusercontent.com/makevoid/2be2170f17801c761aadfe7d9978b003/raw/0fd04b699b5ef461205f0e0ca831bc60b3b72a98/install-ruby-3-debian.sh
