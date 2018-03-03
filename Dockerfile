FROM alpine:latest
LABEL maintainer="mrabbitt"

RUN apk update && apk add apache2 php5-apache2 php5-json php5-soap php5-openssl php5-curl
RUN mkdir -p /var/run/apache2 && chown apache:apache /var/run/apache2
# TODO Install Workbench from source
RUN rm /var/www/localhost/htdocs/index.html && echo '<?php phpinfo() ?>' > /var/www/localhost/htdocs/index.php

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND", "-f", "/etc/apache2/httpd.conf"]
EXPOSE 80
