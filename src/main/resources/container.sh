#!/bin/sh -x

/usr/local/xaas/apache-activemq-5.15.12/bin/activemq start
sleep 2
java -Dlogback.configurationFile=/usr/local/xaas/classes/logback.xml -jar /usr/local/xaas/camel-spring-docker-proto-0.1.0.jar

