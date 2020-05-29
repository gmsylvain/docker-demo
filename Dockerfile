FROM openjdk:8-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
WORKDIR /usr/local/xaas
ARG SRC=src
ARG DEPENDENCY=target
COPY apache-activemq-5.15.12 /usr/local/xaas/apache-activemq-5.15.12
COPY ${DEPENDENCY}/WEB-INF/lib /usr/local/xaas/WEB-INF/lib
#COPY ${DEPENDENCY}/META-INF /usr/local/xaas/WEB-INF
COPY ${DEPENDENCY}/classes /usr/local/xaas/classes
COPY ${DEPENDENCY}/camel-spring-docker-proto-0.1.0.jar /usr/local/xaas
COPY ${SRC}/main/resources/container.sh /usr/local/xaas
RUN chown -R spring:spring .
EXPOSE 1411-5000
USER spring:spring
#ENTRYPOINT ["java","-cp","app:app/lib/*","hello.Application"]
ENTRYPOINT ["/usr/local/xaas/container.sh", "start"]
#ENTRYPOINT ["/usr/local/xaas/apache-activemq/bin/activemq", "start"]
#ENTRYPOINT ["java", "-Dlogback.configurationFile=/usr/local/xaas/classes/logback.xml", "-jar", "/usr/local/xaas/camel-spring-docker-proto-0.1.0.jar"]
