# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box = 'binofparts'
  config.vm.hostname = 'binofparts'
  config.vm.define "binofparts"
  config.vm.provider :virtualbox do |vb|
      vb.name = "binofparts"
      vb.customize ["modifyvm", :id, "--memory", 2048]
      vb.customize ["modifyvm", :id, "--cpus"  , 2]
  end

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/binofparts", type: "rsync"

  config.vm.post_up_message = "
    Welcome to the Bin of Parts VM!

    Run \'vagrant ssh\' to connect to your newly created virtual machine.
    Then run \'cd /binofparts\' to change to the project directory

    If this is your first time running this virtual machine be sure to run
    \'bundle\' and then setup the database by running \'rake db:setup\'. 
    
    You can then run \'rails s\' to start the server. 
    Navigate to http://localhost:3000 to view the site.

    Please be sure to follow @binofparts on twitter for the latest updates.


    -Aaron Holland
    "
end
