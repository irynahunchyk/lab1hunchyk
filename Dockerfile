FROM ubuntu:latest


RUN apt-get update && apt-get -y install curl sendmail
RUN apt-get update && apt-get -y install coreutils

COPY webserver_check.sh /usr/local/bin/webserver_check.sh
 RUN apt-get update && \
    apt-get install -y dos2unix
RUN dos2unix /usr/local/bin/webserver_check.sh && \
    chmod +x /usr/local/bin/webserver_check.sh
RUN chmod +x /usr/local/bin/webserver_check.sh
COPY my-script.log /var/log/my-script.log
CMD ["bash", "-c", "while true; do /usr/local/bin/webserver_check.sh; sleep 30; done"]
