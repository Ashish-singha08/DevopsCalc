FROM maven AS build
RUN mkdir -p /workspace
WORKDIR /workspace
COPY pom.xml /workspace
COPY src /workspace/src
RUN mvn clean install -Dmaven.test.skip=true

FROM openjdk
COPY --from=build /workspace/target/*.jar app.jar
EXPOSE 5050
ENTRYPOINT ["java","-jar","app.jar"]
