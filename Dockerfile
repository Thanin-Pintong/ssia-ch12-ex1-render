FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ARG DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt-get update
RUN apt-get -y install openjdk-8-jdk
RUN apt-get -y install maven
RUN apt-get -y install vim
RUN apt-get -y install sudo
RUN apt-get -y install curl
RUN apt-get -y install wget
RUN apt-get -y install locales
RUN apt-get -y install tzdata
RUN locale-gen en_US.UTF-8
RUN locale-gen th_TH.UTF-8
RUN update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN rm /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Bangkok /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get clean

COPY . .
RUN mvn clean package -DskipTests

EXPOSE 80
ENTRYPOINT ["java","-jar","target/ssia-ch12-ex1-render-0.0.1-SNAPSHOT.jar"]