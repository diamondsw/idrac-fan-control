FROM alpine:edge

RUN apk --no-cache add ipmitool apk-cron

COPY crontab /etc/cron.d/fan-control
COPY adjust-fans.sh /opt/adjust-fans.sh
COPY reset-fans.sh /opt/reset-fans.sh
RUN chmod 0777 /etc/cron.d/fan-control && \
    chmod 0777 /opt/*.sh && \
    /usr/bin/crontab /etc/cron.d/fan-control

# These can be overridden at runtime
ENV IDRAC_HOST=192.168.0.120 \
    IDRAC_USER=root \
    IDRAC_PW=calvin \
    FANSPEED=30 \
    MAXTEMP=40

CMD /opt/adjust-fans.sh && crond
