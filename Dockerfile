FROM 	systemd_centos7

RUN 	yum -y install nfs-utils

RUN 	mkdir -p /srv/storage &&\
	echo "/srv/storage *(rw,sync,no_root_squash,no_all_squash)" >> /etc/exports

RUN	systemctl enable rpcbind &&\
	systemctl enable nfs-server &&\
	systemctl enable nfs-lock &&\
	systemctl enable nfs-idmap

EXPOSE 2049

CMD ["/usr/sbin/init"]
