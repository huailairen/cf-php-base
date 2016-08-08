FROM index.alauda.cn/chofnorg/chaofan-php-base  

COPY nginx.conf  /etc/nginx/
RUN mkdir /cflogs/ 
COPY cnweb /var/www/cnweb
COPY Spring  /var/www/Spring
RUN sed -i 's/\;default_charset/default_charset/g'  /usr/local/php/lib/php.ini
RUN sed  -i "s/short_open_tag = Off/short_open_tag = On/g" /usr/local/php/lib/php.ini
COPY supervisord.conf  /etc
CMD ["supervisord", "-n","-c", "/etc/supervisord.conf"]
