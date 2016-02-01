FROM qnib/alpn-base:edge

RUN apk add py-pip && \
    pip install --upgrade pip && \
    pip install supervisor && \
    rm -rf /var/cache/apk/*
ADD etc/supervisord.conf /etc/
ADD opt/qnib/supervisor/start.sh /opt/qnib/supervisor/
