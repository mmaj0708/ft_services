#! /bin/ash

printf "nginx test :"
service nginx status
ret_nginx=$?

printf "\nphp test :"
service php-fpm7 status
ret_php=$?

if [ $ret_nginx = 0 ] && [ $ret_php = 0 ]
then
    exit 0
else
    exit 1
fi