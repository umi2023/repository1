#!/bin/bash
/usr/local/bin/node_exporter &
java -Djava.security.egd=file:/dev/./urandom -jar /app.jar server /app-config.yml
