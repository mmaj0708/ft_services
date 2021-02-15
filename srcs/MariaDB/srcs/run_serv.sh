openrc
touch /run/openrc/softlevel
adduser -D -g 'www' www
/etc/init.d/mariadb setup
/etc/init.d/mariadb restart
mysql --user=root << EOF
CREATE DATABASE wordpress;
CREATE USER 'admin'@'%' IDENTIFIED BY 'password';
GRANT ALL ON wordpress.* TO 'admin'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
CREATE USER 'admin'@'%' IDENTIFIED BY 'password';
GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# sed -i -e "s/<ip>/172.17.0.5/g" wordpress.sql
mysql --user=root wordpress < wordpress_save.sql

prinf "database started\n"
tail -F /dev/null