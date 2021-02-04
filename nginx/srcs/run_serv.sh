
# ssh key
openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt


service nginx restart
# service php-fpm7 restart
tail -F /dev/null