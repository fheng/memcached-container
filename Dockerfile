FROM registry.access.redhat.com/rhel7:latest

EXPOSE 11211

RUN PKGS='memcached nc' && \
    yum -y install $PKGS && \
    yum clean all  && \
    ln -sf /usr/share/zoneinfo/UTC /etc/localtime

COPY licenses/ /root/licenses/rhmap/

USER memcached

ENTRYPOINT ["memcached"]
CMD ["-m", "512", "-vv"]
