FROM ubuntu
RUN apt-get update
RUN apt-get install -y --no-install-recommends libreoffice
RUN apt-get install -y \
    openssh-server \
    xauth 

RUN mkdir /var/run/sshd \
    && mkdir /root/.ssh \
    && chmod 700 /root/.ssh \
    && ssh-keygen -A \
    && sed -i "s/^.*X11Forwarding.*$/X11Forwarding yes/" /etc/ssh/sshd_config \
    && sed -i "s/^.*X11UseLocalhost.*$/X11UseLocalhost no/" /etc/ssh/sshd_config \
    && grep "^X11UseLocalhost" /etc/ssh/sshd_config || echo "X11UseLocalhost no" >> /etc/ssh/sshd_config

#RUN echo "alias browser=firefox" >> /etc/skel/.bashrc
ADD ./entrypoint.sh .
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["sh", "entrypoint.sh"] 
