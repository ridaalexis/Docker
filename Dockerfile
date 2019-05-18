FROM nginx
RUN mkdir -p /var/www/rida.com/images
COPY ./ra.jpg /var/www/rida.com/images
RUN chmod -R 754 /var/www/rida.com && \
useradd rida && \
groupadd alexis
RUN usermod -G alexis rida && \
chown -R rida:alexis /var/www/rida.com && \ 
sed -i 's#/usr/share/nginx/html#/var/www/rida.com#g' /etc/nginx/conf.d/default.conf &&\
sed -i 's/user  nginx/user rida/g' /etc/nginx/nginx.conf
COPY ./index.html /var/www/rida.com 


