[![Build Status](https://travis-ci.org/BinofParts/binofparts.svg?branch=master)](https://travis-ci.org/BinofParts/binofparts) [![Code Climate](https://codeclimate.com/github/BinofParts/binofparts.png)](https://codeclimate.com/github/BinofParts/binofparts) [![Coverage Status](https://img.shields.io/coveralls/BinofParts/binofparts.svg)](https://coveralls.io/r/BinofParts/binofparts?branch=master)

Contributing?
============

[![Join the chat at https://gitter.im/BinofParts/binofparts](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/BinofParts/binofparts?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Bin of Parts is built using the Ruby on Rails framework.   
If you would like to contribute to this project please follow these setup instructions below.


[Fork this Repository! ](https://github.com/BinofParts/binofparts/fork) 

A Vagrantfile is provided to smooth the development setup process. To use the preconfigured Virtual Machine you will have to install VirtualBox and Vagrant.

[Install VirtualBox](https://www.virtualbox.org/wiki/Downloads)  
[Install Vagrant](https://www.vagrantup.com/)

##### Quick Setup  
1. Clone fork to local computer `git clone https://github.com/USERNAME/binofparts.git`
2. Navigate to root directory. `cd binofparts`
3. Setup the VM.`vagrant up`
4. SSH Into the VM. `vagrant ssh`
5. Change to project root directory. `cd /binofparts`
6. Install project dependencies. `bundle`
7. Setup the database. `rake db:setup`
8. Start local Rails Server. `rails s`
9. You're good to go! You can access the site at [localhost:3000](http://localhost:3000)

  **_Warning: Make sure to replace USERNAME with your github username when cloning_**

##### Testing
The project is tested using rspec and capybara, along with factorygirl for factories. It is already setup to use Guard-rspec. 
This way you can use guard to automatically detect any changes to specs and run the tests for you.

To run guard:

1. startup the vagrant vm `vagrant up`
2. ssh into the box `vagrant ssh`
3. `cd /binofparts`
4. run guard with polling enabled `bundle exec guard -pc`

**_TIP: If running guard uses to much of your cpu you can limit cpu usage. Add the `-l 10` flag onto the end of the guard command._**
