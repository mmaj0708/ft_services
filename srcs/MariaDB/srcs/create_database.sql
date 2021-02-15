-- CREATE DATABASE wordpress;
-- CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'password';
-- GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password';
-- FLUSH PRIVILEGES;

CREATE DATABASE wordpress;
CREATE USER 'admin'@'%' IDENTIFIED BY 'password';
GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
CREATE USER 'admin'@'%' IDENTIFIED BY 'password';
GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;