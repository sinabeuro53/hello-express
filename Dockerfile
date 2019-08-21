FROM openjdk:8-jre

COPY target/springjar-*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]

MAINTAINER Jeonghwan<ej88ej@gamil.com>

RUN apt-get update
RUN apt-get install -y nodejs npm

ADD bin /var/www/bin
ADD public /var/www/public
ADD routes /var/www/routes
ADD views /var/www/views
ADD app.js /var/www/app.js
ADD package.json /var/www/package.json

WORKDIR /var/www

RUN npm install

CMD npm start

EXPOSE 3000
