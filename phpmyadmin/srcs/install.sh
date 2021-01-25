# install php7
# apk add php7 php7-fpm php7-opcache php7-mbstring php7-session php7-common php7-iconv \
# php7-zlib php7-json php7-gd php7-curl php7-xml php7-mysqli \
# php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
# php7-soap php7-xmlrpc php7-posix php7-mcrypt \
# php7-gettext php7-ldap php7-ctype php7-dom \
# mysql mysql-client php-mysql php-mysqli 

# install PMA
wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
rm phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
mv phpmyadmin /www