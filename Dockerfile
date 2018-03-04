FROM alpine:latest
LABEL maintainer="mrabbitt"
ENV WORKBENCH_VERSION=41.0.1

RUN apk update  \
    && apk add apache2 php5-apache2 php5-json php5-soap php5-openssl php5-curl  \
    && mkdir -p /var/run/apache2  \
    && chown apache:apache /var/run/apache2
RUN apk add curl \
    && curl -L "https://github.com/ryanbrainard/forceworkbench/archive/${WORKBENCH_VERSION}.tar.gz" -o workbench.tar.gz  \
    && tar xzvf workbench.tar.gz --strip-components=1 forceworkbench-${WORKBENCH_VERSION}/workbench  \
    && rm workbench.tar.gz  \
    && rm -rf /var/www/localhost/htdocs   \
    && ln -sf /workbench /var/www/localhost/htdocs  \
    && chmod -R a+r /workbench

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND", "-f", "/etc/apache2/httpd.conf"]
EXPOSE 80
