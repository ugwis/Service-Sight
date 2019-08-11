#!/bin/sh
echo 

# Check Linux Kernel Version
echo -e "\033[0;36m# Check Linux Kernel Version\033[0;39m"
if [ -f /proc/version ];then
  cat /proc/version
fi
echo

# Check Distribution Version
echo -e "\033[0;36m# Check Distribution Version\033[0;39m"
if [ -f /etc/redhat-release ];then
  cat /etc/redhat-release
elif [ -f /etc/lsb-release ];then
  cat /etc/lsb-release
elif [ -f /etc/debian_version ];then
  cat /etc/debian_version
elif [ -f /etc/fedora-release ];then
  cat /etc/fedora-release
elif [ -f /etc/system-release ];then
  cat /etc/system-release
fi
echo

# Check TimeDate
echo -e "\033[0;36m# Check Timedate\033[0;39m"
date
echo

# Discover Services
echo -e "\033[0;36m# Discover Services\033[0;39m"
coloring_service() {
  service=`systemctl list-unit-files | grep $1`
  export GREP_COLOR="1;32"
  echo $service | grep enabled --color=always
  export GREP_COLOR="1;31"
  echo $service | grep disabled --color=always
}
## Web Servers
coloring_service nginx
coloring_service http
coloring_service apache
coloring_service lighttpd
coloring_service hiawatha
coloring_service cherokee
coloring_service thttpd
coloring_service zope
coloring_service h2o
coloring_service squid
coloring_service glb
coloring_service seesaw
coloring_service haproxy
coloring_service zevenet
coloring_service traefik

## Database
coloring_service mysql
coloring_service maria
coloring_service pg
coloring_service postgres
coloring_service dbora
coloring_service oracle
coloring_service firebird
coloring_service cubrid
coloring_service derby
coloring_service redis
coloring_service hsqldb
coloring_service ingress
coloring_service memcache
coloring_service mongo

## Language
coloring_service go
coloring_service php
coloring_service perl
coloring_service rust
coloring_service python

# Other
coloring_service isu
coloring_service docker
coloring_service kube
coloring_service named
coloring_service bind9
coloring_service dnsmasq
coloring_service unbound
coloring_service nsd


echo 
