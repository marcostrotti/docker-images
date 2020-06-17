#!/bin/bash

echo "Starting PROXYSQL"

proxysql --initial -f -c /etc/proxysql.cnf &

PROXYID=$!

sleep 5


echo "Setting up Values for PROXYSQL"

mysql -h127.0.0.1 -P6032 --user=radmin --password=radmin << EOF
INSERT INTO mysql_servers (hostname) VALUES ("$MYSQL_DB_HOST");
INSERT INTO mysql_servers (hostgroup_id, hostname) VALUES (1, "$MYSQL_DB_HOST");
UPDATE mysql_servers SET max_connections=300 WHERE hostname="$MYSQL_DB_HOST";
INSERT INTO mysql_users(username,password,default_hostgroup,default_schema) VALUES ("$MYSQL_DB_USER","$MYSQL_DB_PASS",1,"$MYSQL_DB_DATABASE");

COMMIT;

SAVE MYSQL USERS TO DISK;
SAVE MYSQL SERVERS TO DISK;

LOAD MYSQL USERS TO MEMORY;
LOAD MYSQL SERVERS TO MEMORY;

LOAD MYSQL USERS TO RUNTIME;
LOAD MYSQL SERVERS TO RUNTIME; 

EOF

wait $PROXYID