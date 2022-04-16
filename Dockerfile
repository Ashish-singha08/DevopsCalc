FROM openjdk:8
COPY ./target/DevopsCalc-1.0-SNAPSHOT-jar-with-dependencies.jar ./
WORKDIR ./
CMD ["java", "-jar", "DevopsCalc-1.0-SNAPSHOT-jar-with-dependencies.jar"]