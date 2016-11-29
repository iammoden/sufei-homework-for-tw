##程序介绍
  本程序是通过vagrant+docker+ansible来部署一个java程序(仅仅只是一个hello word).
  由于vagrant的box镜像太大,国内下载也太慢.因为我选择了在标准的centos系统环境上来构建.并且我提供一个脚本来初始化,一切仅仅只是为了演示,
  因水平有限,目前在中移德电工作,主要在vcloud/vsphere+puppet+python上的devops,熟悉的也只是一些中间件.对ansible,docker还是首次接触,望能多多指教.


- 系统环境: centos72
- 内存大小: 2G
- 软件要求:ansible vagrant virtulbox docker

如未安装上述软件,则在保证主机可以上网的情况下(可访问互联网,可dns解析),执行以下脚本构建:
```
###########begin###############
rpm -iUvh  http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -iUvh https://releases.hashicorp.com/vagrant/1.8.7/vagrant_1.8.7_x86_64.rpm
   


yum install wget git ansible docker -y

yum install gcc make kernel-devel -y

cd /etc/yum.repos.d
wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
yum install VirtualBox-5.1 -y

var=`uname -r`;export KERN_DIR=/usr/src/kernels/${var:0:10}*
/sbin/vboxconfig
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostmanager
systemctl start docker.service

cd ~
git clone https://github.com/iammoden/sufei-homework-for-tw
cd ~/sufei-homework-for-tw/
vagrant up

#############end###############
```





##测试方法:
```
vagrant完成后,需要等待约1-2分钟,以便后台装载java(hello world sample)程序.然后可通过以下命令测试:
- curl http://127.0.0.1:7000/hello/ThoughtWorks
- curl http://127.0.0.1:7000/hello/ILoveU
```

如果要想实现,外部访问,可通过一条iptables 规则.



> PS:
>  话痨一点:
>  原来的框架打算用一个compose,三台docker.分别为app,db,svn.其中app放入两个docker,每个docker放cluster-as01,cluster-as02以及haproxy01,haproxy02,db使用pg,db在外加一个consul来配合haproxy自动生成服务(通haproxy的acl).再搞个jenkins自动CI。这个周五晚上初步愿望是非常美好的.
>  可惜,现实是周未一直家事缠身.这个最终的作业我只花了数个小时,水平有限还是边(东)学(抄)边(西)做(抄).因时间仓促望能包涵。虽然我还是入门阶段,但我有信心如果能在TW的这样的环境下工作,不敢说跟上大神的脚步,我有信心只需两周就可以进入状态. XD



苏飞
2016-11-28










