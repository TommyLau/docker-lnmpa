FROM debian:jessie

# Install needed packages
RUN apt-get update && apt-get install -y git openssh-server --no-install-recommends \
	&& rm -r /var/lib/apt/lists/*

# Make the missing directory
RUN mkdir /var/run/sshd \
	&& chmod 0755 /var/run/sshd

# Run SSH Server
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
