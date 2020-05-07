#!/bin/bash
rm -rf lib python

mkdir -p lib
for version in "python3.6" "python3.7" "python3.8"
do
echo "Building $version ..."
mkdir -p python/lib/${version}
docker run -v "$PWD":/var/task "lambci/lambda:build-$version" /bin/sh -c "yum install -y mysql-devel && cp /usr/lib64/mysql/libmysqlclient* lib/ && pip install mysqlclient -t python/lib/$version/site-packages/ && exit"
done

zip -r mysqlclient-lambda-layer.zip lib python > /dev/null
