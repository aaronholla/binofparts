[![Build Status](https://travis-ci.org/BinofParts/binofparts.svg?branch=master)](https://travis-ci.org/BinofParts/binofparts) [![Coverage Status](https://img.shields.io/coveralls/BinofParts/binofparts.svg)](https://coveralls.io/r/BinofParts/binofparts?branch=master)

Contributing?
============

Bin of Parts is built using the Ruby on Rails framework.   
If you would like to contribute to this project please follow these setup instructions below.


[Fork this Repository! ](https://github.com/BinofParts/binofparts/fork) 

A Vagrantfile is provided to smooth the development setup process. To use the preconfigured Virtual Machine you will have to install VirtualBox and Vagrant.

[Install VirtualBox](https://www.virtualbox.org/wiki/Downloads)  
[Install Vagrant](https://www.vagrantup.com/)

##### Quick Setup  
  ````
    $ git clone https://github.com/USERNAME/binofparts.git
    $ cd binofparts
    $ vagrant up
    $ vagrant ssh
    $ cd /binofparts
    $ bundle
    $ rake db:setup
    $ rails s
  ````
  **_Warning: Make sure to replace USERNAME with your github username when cloning_**

##### Detailed Instructions
1.  Clone fork to local computer
2.  Navigate to root directory.
6.  Setup the VM. _This may take a few minutes_
7.  SSH Into the VM.
8.  Change to the project root.
9.  Install project dependencies.
10. Setup the database.
11. Start local Rails Server.
12. You're good to go! You can access the site at [localhost:3000](http://localhost:3000)
