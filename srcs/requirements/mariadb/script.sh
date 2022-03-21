chmod o+w /dev/stdout
chmod o+w /dev/stderr
if [ ! -d /var/lib/mysql/${DB_NAME} ]; then
	echo "First run"
	mysqld&
	until mysqladmin ping; do
		sleep 2
	done
    mysql -u root -e "CREATE DATABASE ${DB_NAME};"
    mysql -u root -e "SET GLOBAL general_log_file='mariadb.log';"
    mysql -u root -e "CREATE USER '${DB_ROOT}'@'%' IDENTIFIED BY '${DB_ROOTPSWRD}';"
    mysql -u root -e "GRANT ALL ON *.* TO '${DB_ROOT}'@'%';"
    mysql -u root -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_USERPSWRD}';"
    mysql -u root -e "GRANT ALL ON db_wordpress.* TO '${DB_USER}'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
	mysql -e "DELETE FROM mysql.user WHERE user=''"
	mysql -e "DELETE FROM mysql.user WHERE user='root'"
	mysql -e "FLUSH PRIVILEGES"
	killall mysqld
	echo "End first run"
	else
		echo "database already created"
fi
mysqld --slow-query-log-file=/dev/stderr --slow-query-log
