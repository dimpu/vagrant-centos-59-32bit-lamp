# vagrant-centos-59-32bit-lamp
![Open cmd here](https://github.com/dimpu/vagrant-centos-59-32bit-lamp/raw/master/src/imgs/Vagrant.png )


##What is Vagrant?
Vagrant is small tool which is inveted to make deverloper life easy. By typing a few command you can create your production enveronment in your development machine. To know more about vagrant just go to http://vagrantup.com

##Why vagrant with centOS?
The production environment may be any kind. So may use linux with RedHat flavour or some may use linux with Debian flavour or it may be compleately windows. I’m asumeing development is in windows and the production is on linux centos box. There are many Linux boxes available. http://vagrantcloud.com and http://vagrantbox.es but unfortunately there is no centos 59 i386 box with LAMP stack. It happened to be most of my projects use that environment. So, I have create that box with all features I need.

##What does this box contains.
The box comes with following tools and softwares.
1.  Apache(2.2)[Virtual host enabled]
2.  PHP(5.6.5)[with extinctions mssql,pdo,curl,mcrypt,mysql,composer ]
3.  php-my-admin
4.  nano
5.  MYSQL[Database]

## Pre-requisites
1. WinRAR (GitHub not allowing file size more than 100mb my box is around 300 MB so I had to split the box file)
2. VirtualBox-4.3.20 (http://download.virtualbox.org/virtualbox/4.3.20/VirtualBox-4.3.20-96997-Win.exe)
3. Vagrant 1.7.3 (https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2.msi)
4. git (http://git-scm.com/downloads).
5. Admin privilege to modify hosts file

##Getting Stated.
Download and install the above mentioned software in the same order. We need to set environment variable (path) for everything after installation. Please refer the following link to set path variable (http://www.computerhope.com/issues/ch000549.htm)
![Path](https://github.com/dimpu/vagrant-centos-59-32bit-lamp/raw/master/src/imgs/path.png )
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
Finally you’re done with setting up the environment. You just need to run a final command to make things work.
Press shift key + Right click in the open space in vagrant you should get the option Open Command window here. Select it or just open your command window and navigate to the folder.

![Open cmd here](https://github.com/dimpu/vagrant-centos-59-32bit-lamp/raw/master/src/imgs/open-cmd-here.png )

Just type the following command 

```bash
vagrant up --provision

```
