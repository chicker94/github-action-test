FROM tomcat:9-jre11-openjdk-slim AS build

COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

RUN catalina.sh start && \
    while [ ! -d /usr/local/tomcat/webapps/ROOT ]; do sleep 1; done && \
    catalina.sh stop

FROM nginx:stable-alpine

COPY --from=build /usr/local/tomcat/webapps/ROOT /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

