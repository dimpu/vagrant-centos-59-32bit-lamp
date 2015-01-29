# vagrant-centos-59-32bit-lamp
![Open cmd here](https://github.com/dimpu/vagrant-centos-59-32bit-lamp/raw/master/src/imgs/Vagrant.png )


##What is Vagrant?
There are so many tutorials available on the net. Go to http://vagrantup.com.

##Why vagrant with centOS?
Vagrant works with Linux boxes. There are many Linux boxes available. http://vagrantcloud.com and http://vagrantbox.es but unfortunately there is no centos 59 i386 box with LAMP stack. It happened to be most of my projects use the environment I’ve mentioned above so I created this box.

## Pre-requisites
1. WinRAR (GitHub not allowing file size more than 100mb my box is around 300 MB so I had to split the box file)
2. VirtualBox-4.3.20 (http://download.virtualbox.org/virtualbox/4.3.20/VirtualBox-4.3.20-96997-Win.exe)
3. Vagrant 1.7.3 (https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2.msi)
4. git (http://git-scm.com/downloads).
5. Admin privilege to modify hosts file

##Getting Stated.
Download and install the above mentioned softwares in the same order. We need to set environment variable (path) for everything after installation. Please refer the following link to set path variable (http://www.computerhope.com/issues/ch000549.htm)

Once everything is done we should clone this project using git tool.

```bash
vagrant clone https://github.com/dimpu/vagrant-centos-59-32bit-lamp.git

```

Now, go to the vagrant folder and extract the rar file to create the box file.

Right click on vagrant-centos-59-32bit-lamp.part1.rar and select extract here you will get the vagrant-centos-59-32bit-lamp.box file.

## settings.json
In vagrant folder you can see the file “Vagrantfile” which is heart of the vagrant. To make things easy I have created settings.json in which you can add your own settings. So you don't have to touch Vagrantfile at all.

Now just look indie settings.json
```json
{
  "folders": [{
      "map": "C:/path/to/projects",
      "to": "/var/www/html"
    }
  ],
  "sites": [{
    "map": "sites1.local",
    "to": "/var/www/html/sites1"
  }, {
    "map": "site2.local",
    "to": "/var/www/html/site2"
  }, {
    "map": "phpmyadmin.local",
    "to": "/var/www/html/phpMyAdmin"
  }]
}
```
Folders will let you synchronize your host folder with the guest. Usually in Linux we have all our projects inside /var/www/html so I have synchronized my c:/xampp/htdocs with /var/www/.

After synchronization you have to set up the virtual hosts on the Linux box. You can add as many sites as you want. To do so just add the object (map, to pair) of the sites property in settings file.

````bash 
{
    "map": "phpmyadmin.local",
    "to": "/var/www/html/phpMyAdmin"
  }
````

##Setting virtual domains 
We need to assign 192.168.10.10 to the virualbox (You can change if you want but you need to change it in Vangrantfile). Now in order to access you sites you need to modify your hosts file. To do that open the file C:\Windows\System32\drivers\etc\hosts and add as following

``` bash
192.168.10.10 site1.local
192.168.10.10 site2.local
  .
  .

```

## Boot up
Finally you’re done with setting up the environment. You just need to run a command to make things work.
Press shift key + Right click in the open space in vagrant you should get the option Open Command window here. Select it.

![Open cmd here](https://github.com/dimpu/vagrant-centos-59-32bit-lamp/raw/master/src/imgs/open-cmd-here.png )

just type the following command 

```bash
vagrant up --provision

```