# vagrant-centos-59-32bit-lamp
![Open cmd here](https://github.com/dimpu/vagrant-centos-59-32bit-lamp/raw/master/src/imgs/Vagrant.png )


##What is Vagrant?
There are so many tutorials on it just google it. To get started got to http://vagrantup.com.

##Why is the project?
Vagrant work with Linux boxes. There are so many Linux boxes available. http://vagrantcloud.com and
http://vagrantbox.es but unfortunately there is no centos 59 i386 box with LAMP stack is not available there. It happened to be most of my projects are in that environment so I created this box for me.

## Prerequisites
1. WinRAR(GitHub not allowing file size more than 100mb my box is around 300 MB so I had to split the box file)
2. VirtualBox-4.3.20(http://download.virtualbox.org/virtualbox/4.3.20/VirtualBox-4.3.20-96997-Win.exe)
3. Vagrant 1.7.3(https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2.msi)
4. git(http://git-scm.com/downloads).
5. Admin privilege to modify hosts file

##Getting Started.
Download above all in the same order and install them in the same order. Make sure all these tools are in path. If you don't know how to do it there as nice article about it in here (http://www.computerhope.com/issues/ch000549.htm)

Once everything is setup. Clone this this project using git tool.

```bash
vagrant clone https://github.com/dimpu/vagrant-centos-59-32bit-lamp.git

```

Now, got inside the vagrant folder and extract the rar file to create the box file.

Right click on vagrant-centos-59-32bit-lamp.part1.rar and select extract here you will get the vagrant-centos-59-32bit-lamp.box file.

## settings.json
Inside your vangrant folder you can see the file Vagrantfile which is heart of the vagrant. In order to make things clear i have created a settings.json in which you can make add your settings happen. So you don't have to touch Vagrantfile at all.

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
folders will let you synchronize your host folder with the guest. In general in Linux we will have all or projects inside /var/www/html so I have synchronized my  c:/xampp/htdocs with /var/www/html it's easy for me.

After folder synchronize is done you have to set up the virtual hosts on the Linux box. You can add as many sites as you want just add the pair of map,to object to the sits property in settings file.

##Setting virtual domains 
The thing you need to know is that we assigned 192.168.10.10 to the virualbox(Your can change if you want to do so you need to change it in Vangrantfile). Now in order to access you sites you need to modify your hosts file. To do that open the file C:\Windows\System32\drivers\etc\hosts and add as following

``` bash
192.168.10.10 site1.local
192.168.10.10 site2.local
 	.
 	.

```

## Boot up
Finally you’re done with all setting you just need to run one command to make things work.
Press shift key + Right click in the open space in vagrant you should get the option Open Command window here and select it

![Open cmd here](https://github.com/dimpu/vagrant-centos-59-32bit-lamp/raw/master/src/imgs/open-cmd-here.png )

just type the following command 

```bash
vagrant up --provision

```
