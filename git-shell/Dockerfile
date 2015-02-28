FROM debian:jessie

# Install needed packages & create the needed directory
RUN apt-get update && apt-get install -y git openssh-server --no-install-recommends \
	&& rm -r /var/lib/apt/lists/* \
	&& mkdir /var/run/sshd \
	&& chmod 0755 /var/run/sshd \
	&& echo 'git:x:33:33:git:/home/git:/usr/bin/git-shell' >> /etc/passwd \
	&& echo 'git:*:16462:0:99999:7:::' >> /etc/shadow \
	&& echo 'git:x:33:' >> /etc/group \
	&& mkdir /home/git \
	&& chown 33.33 /home/git

# Run SSH Server
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
