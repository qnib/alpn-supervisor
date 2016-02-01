FROM qnib/alpn-base

RUN apk update && apk upgrade && \
    apk add py-pip && \
    pip install --upgrade pip && \
    pip install supervisor && \
    rm -rf /var/cache/apk/*
ADD etc/supervisord.conf /etc/
ADD opt/qnib/supervisor/start.sh /opt/qnib/supervisor/
CMD [ "/opt/qnib/supervisor/start.sh", "-n" ]
