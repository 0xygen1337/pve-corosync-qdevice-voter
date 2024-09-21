# Use the latest Debian as the base image
FROM debian:latest

# Update package lists and install required packages
RUN apt-get update && \
    apt-get install -y openssh-server sudo corosync-qnetd corosync-qdevice && \
    mkdir /var/run/sshd

# Allow setting the root password through an environment variable
ARG ROOT_PASSWORD
RUN echo "root:${ROOT_PASSWORD:-cluster1337}" | chpasswd

# Allow root login via SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Ensure SSH service runs in the foreground, container stays active
CMD ["/usr/sbin/sshd", "-D"]

# Expose the default SSH port
EXPOSE 22