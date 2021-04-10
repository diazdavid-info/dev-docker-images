FROM elasticsearch:7.12.0

COPY ./curator.repo /etc/yum.repos.d/.

RUN yum install -y elasticsearch-curator
