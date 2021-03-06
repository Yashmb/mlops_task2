FROM centos

RUN yum install sudo wget net-tools systemd git  -y

RUN sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

RUN sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

RUN yum install jenkins -y

RUN yum install java-11-openjdk.x86_64 -y

RUN echo "jenkins  ALL=(ALL)      NOPASSWD: ALL" >> /etc/sudoers

CMD ["java", "-jar", "/usr/lib/jenkins/jenkins.war"]

EXPOSE 8080

