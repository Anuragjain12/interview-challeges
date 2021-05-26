FROM nginx
##upgrading
RUN apt-get upgrade
###chnaging the permission and ownership of required folders
RUN chown -R nginx:nginx /var/cache/nginx
RUN chown -R nginx:nginx /var/log/nginx
RUN chown -R nginx:nginx /etc/nginx/conf.d
## Creating pid file and chnaing its ownership
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid
##switching to nginx user
USER nginx
ADD ./public/ /usr/share/nginx/html/
