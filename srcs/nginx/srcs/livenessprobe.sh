#! /bin/ash

printf "nginx test :"
service nginx status
ret_nginx=$?

if [ $ret_nginx = 0 ]
then
    exit 0
else
    exit 1
fi