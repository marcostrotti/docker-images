FROM proxysql/proxysql:2.0.9

RUN apt update && apt install mysql-client -y

ADD ./proxysql.cnf /etc/proxysql.cnf
ADD ./startup.sh ./startup.sh
RUN chmod +x ./startup.sh


ENV MYSQL_DB_USER=''
ENV MYSQL_DB_PASS=''
ENV MYSQL_DB_HOST=''
ENV MYSQL_DB_DATABASE=''

EXPOSE 6032 6033

ENTRYPOINT ["./startup.sh"]
