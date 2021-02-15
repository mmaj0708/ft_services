

mkdir ftp

# creer ftp_user avec mdp=password + donner les droits
echo -e "password\npassword" | adduser -h /ftp/ ftp_user
chown ftp_user:ftp_user /ftp/

# cle + certif ssl avec common name = localhost
openssl req -new -x509 -days 365 -nodes -subj '/CN=localhost' -newkey \
rsa:1024 -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem

/etc/init.d/vsftpd restart
tail -F /dev/null