FROM registry.access.redhat.com/ubi8/python-36
USER root

WORKDIR /grid-certificates

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN yum install -y https://repo.osg-htc.org/osg/24-main/osg-24-main-el8-release-latest.rpm
RUN yum --enablerepo CodeReady,Builder
RUN yum -y update && yum -y upgrade
RUN yum install -y osg-ca-certs fetch-crl
RUN yum -y update && yum -y upgrade
RUN fetch-crl

RUN cp -r /etc/grid-security/certificates/* /grid-certificates
