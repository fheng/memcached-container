FROM registry.access.redhat.com/rhel7:latest

EXPOSE 11211

RUN PKGS='memcached nc python2-pip' && \
    curl http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm --output epel-release-latest-7.noarch.rpm && \
    rpm -ivh epel-release-latest-7.noarch.rpm && \
    yum -y install $PKGS --enablerepo=epel && \
    yum clean all  && \
    /bin/pip2 install pip --upgrade && \
    /bin/pip2 install pymemcache && \
    ln -sf /usr/share/zoneinfo/UTC /etc/localtime

USER memcached

ENTRYPOINT ["memcached"]
CMD ["-m", "512", "-vv"]
