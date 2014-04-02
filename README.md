# Sinatra Appliance

In here is some puppet manifests and modules for building out a working Sinatra system on a single host.

#if not already installed
gem install librarian-puppet

# bring down latest versions of the puppet modules
# only run this the once
librarian-puppet install

# build the box
vagrant up

# browse to localhost:4567


## Requirements

Vagrant requires you have Virtualbox setup and the vagrant rubygem installed.
You will also required to have a copy of the Puppet modules.
This is a simple once off `librarian-puppet install` before you start.
[librarian-puppet](http://librarian-puppet.com/) can be installed with rubygems.
