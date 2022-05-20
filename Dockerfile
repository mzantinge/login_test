FROM ubuntu
EXPOSE 8080
WORKDIR /var/www/html
COPY . .
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -qq update
RUN apt-get -qq install -y zip php php-curl php-mysql
ENTRYPOINT ["php"]
CMD ["-S", "0.0.0.0:8080"]
