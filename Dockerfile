FROM ubuntu:precise
MAINTAINER joshjdevl < joshjdevl [at] gmail {dot} com>

RUN apt-get update && apt-get -y install python-software-properties 
RUN apt-get -y install bash bridge-utils ebtables iproute libev-dev python tcl8.5 tk8.5 libtk-img

RUN apt-get -y install wget
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN /usr/sbin/sshd
RUN echo "root:josh" | chpasswd

RUN cd /tmp && wget http://downloads.pf.itd.nrl.navy.mil/core/source/archive/core-src-4.3.tgz
RUN cd /tmp && tar -xvf core-src-4.3.tgz

RUN apt-get install -y openssh-server screen traceroute curl 
RUN apt-get install -y subversion git mercurial vim-nox build-essential texinfo 
RUN apt-get install -y gawk automake autoconf libtool python-dev libev-dev bridge-utils 
RUN apt-get install -y libtk-img libxml2-dev libdbus-1-dev sqlite libsqlite3-dev 
#RUN apt-get install -y wireshark ebtables python-libvirt libnl1 
RUN apt-get install -y qtcreator qt4-qtconfig libqt4-core libqt4-gui 
RUN apt-get install -y ant lynx 
RUN apt-get install -y libssl-dev libxml-libxml-perl libxml-simple-perl cpulimit

RUN apt-get install -y software-properties-common
#RUN add-apt-repository ppa:webupd8team/java
#RUN apt-get update
#RUN apt-get install -y oracle-java7-installer

RUN cd /tmp/core-4.3 && ./bootstrap.sh && ./configure
#RUN cd /tmp/core-4.3 && make -j 4 && make install

RUN cd /tmp && wget http://downloads.pf.itd.nrl.navy.mil/core/packages/archive/4.3/linux/core-4.3-0ubuntu1_oneiric_amd64.deb
RUN cd /tmp && dpkg -i core-4.3-0ubuntu1_oneiric_amd64.deb
