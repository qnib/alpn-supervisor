FROM qnib/alpn-base

ENV DUMB_INIT_VER=1.0.0
RUN apk update && apk upgrade && \
    apk add py-pip wget && \
    pip install --upgrade pip && \
    pip install supervisor && \
    mkdir -p /var/log/supervisor/ && \
    wget -qO /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VER}/dumb-init_${DUMB_INIT_VER}_amd64 && \
    chmod +x /usr/local/bin/dumb-init && \
    apk del wget && \
    rm -rf /var/cache/apk/*
ADD etc/supervisord.conf /etc/
ADD opt/qnib/supervisor/bin/start.sh /opt/qnib/supervisor/bin/
CMD [ "/opt/qnib/supervisor/bin/start.sh", "-n" ]
RUN echo "/opt/qnib/supervisor/bin/start.sh" >> /root/.bash_history && \
    echo "supervisorctl status" >> /root/.bash_history
