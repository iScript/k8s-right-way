#!/bin/bash
mkdir -p -m 777 /data2/code
#复制所有/data/code/里的文件到 data2
cp -a /data/code/* /data2/code

#cp /data2/env.test.example /data2/.env

# tail -f /dev/null 这个程序会一直 block 住 ， 不然pod会销毁？
tail -f /dev/null