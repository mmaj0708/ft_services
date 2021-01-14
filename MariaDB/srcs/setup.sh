
/etc/init.d/mariadb restart
mysql --user=root << EOF
CREATE DATABASE wordpress;
CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY '1234';
GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY '1234';
FLUSH PRIVILEGES;
EOF