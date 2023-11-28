FROM mysql

# Set environment variables
ENV MYSQL_HOST=localhost
ENV MYSQL_PORT=3306
ENV MYSQL_ROOT_PASSWORD=password
ENV MYSQL_DATABASE=MusicDatabase

COPY ./init.sql /docker-entrypoint-initdb.d/
EXPOSE 3306

