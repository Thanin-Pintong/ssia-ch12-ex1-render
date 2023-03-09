FROM docker.io/thaninp2021/ubuntu2004-openjdk18-maven36

COPY . .
RUN ls -version

EXPOSE 80
ENTRYPOINT ["java","-version"]