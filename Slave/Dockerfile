FROM ubuntu:18.04

# Make sure the package repository is up to date.
RUN apt-get update
RUN apt-get install -qq wget unzip gnupg software-properties-common curl vim htop nmap openssh-server apt-transport-https git
# Install JDK 8 (latest stable edition at 2019-04-01)
RUN    apt-get install -qy openjdk-8-jdk  
# Install maven
RUN    apt-get install -qy maven
# Cleanup old packages
RUN    apt-get -qy autoremove 
# Add user jenkins to the image
RUN    adduser --quiet jenkins
# Set password for the jenkins user (you may want to alter this).
RUN    echo "jenkins:jenkins" | chpasswd


RUN mkdir -p /run/sshd

RUN echo "Je suis un node Jenkins" > /home/test 

CMD ["/usr/sbin/sshd", "-D"]

# Standard SSH port
EXPOSE 22



