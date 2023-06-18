FROM ikbelaloui/opnjdk-node
ADD target/productcatalogue-0.0.1-SNAPSHOT.jar app.jar
ADD product-catalogue.yml app-config.yml
ADD script.sh script.sh
RUN ["chmod", "+x", "/script.sh"]
EXPOSE 8020 9100
ENTRYPOINT ["/script.sh"]
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar", "server", "app-config.yml"]
