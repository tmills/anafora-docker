FROM httpd:2.4
  
RUN apt update
RUN apt install --yes ca-certificates openssl wget unzip git python python-django nano libapache2-mod-wsgi

RUN git clone https://github.com/weitechen/anafora.git /anafora

RUN mkdir -p /var/www/anafora
RUN mkdir /var/www/html
RUN cp /usr/lib/apache2/modules/mod_wsgi.so modules/
RUN useradd apache
RUN groupadd anafora-admin
RUN usermod -a apache -G anafora-admin
RUN echo "anafora-admin: jw" > /anafora/anafora.group
RUN alias vi='nano'

COPY httpd.conf conf/
COPY wsgi.py /var/www/anafora
COPY anafora.htdigest /var/www/anafora
COPY index.html /var/www/html/

COPY settings.py /anafora/src/web/

EXPOSE 80

ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
