service influxdb restart
sleep 5
influx << EOF
CREATE USER admin WITH PASSWORD 'password' WITH ALL PRIVILEGES;
CREATE DATABASE telegraf;
CREATE USER user_telegraf WITH PASSWORD 'password';
GRANT ALL ON telegraf TO user_telegraf;
EOF
tail -f /dev/null