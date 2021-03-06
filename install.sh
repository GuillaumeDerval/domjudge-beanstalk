#!/bin/bash
export SHELL="${SHELL:-default}"
export PATH="${PATH:-default}"

INSPATH=`pwd`
echo $INSPATH
sleep 5
cd domjudge
echo "dummy:$MY_RDS_HOSTNAME:$MY_RDS_DB_NAME:$MY_RDS_USERNAME:$MY_RDS_PASSWORD" > etc/dbpasswords.secret
./configure --prefix=$INSPATH/domjudge_bin --disable-submitclient --with-webserver-group=webapp --with-domjudge-user=webapp
make install-domserver
cd ../domjudge_bin
find ./ -type f -exec sed -i "s#$INSPATH#/var/www/html#g" {} \;
cd ../
cat domjudge_apache.conf > /etc/httpd/conf.d/domjudge_apache.conf
