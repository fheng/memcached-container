FROM registry.access.redhat.com/rhel7

EXPOSE 11211

RUN PKGS='memcached nc' && \
    yum -y install $PKGS && \
    yum clean all

USER memcached

ENTRYPOINT ["memcached"]
CMD ["-m", "512", "-vv"]
