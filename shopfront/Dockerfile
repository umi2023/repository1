FROM ikbelaloui/opnjdk-node
ADD target/shopfront-0.0.1-SNAPSHOT.jar app.jar
CMD ["/usr/local/bin/node_exporter"]
EXPOSE 8020 9100
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
