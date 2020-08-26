# Install Vagrant
# community provided and not supported by Sander van Vugt
https://www.vagrantup.com/docs/installation/

On OS X the easest way to install is via Homebrew

https://brew.sh/

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

`brew tap caskroom/cask`

`brew cask install virtualbox`

`brew cask install vagrant`

`brew cask install vagrant-manager`

# ssh into hosts

Start up the Vagrant hosts
`vagrant up`

view the running hosts by executing
`vagrant status`

to ssh into any of hosts, execute:
`vagrant ssh <hostname>`

e.g. 
`vagrant ssh control`
