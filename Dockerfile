FROM docker.io/thaninp2021/ubuntu2004-openjdk18-maven36

COPY . .
RUN mvn clean package -DskipTests

EXPOSE 80
ENTRYPOINT ["java","-jar","target/ssia-ch12-ex1-render-0.0.1-SNAPSHOT.jar"]