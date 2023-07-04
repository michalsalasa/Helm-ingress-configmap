FROM nginx:latest

# RUN rm -rf /etc/nginx/conf.d/*

# COPY nginx.conf /etc/nginx/conf.d/

COPY index.html /usr/share/nginx/html



WORKDIR /app

RUN chown -R nginx:nginx /app && chmod -R 755 /app && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d

RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid

USER nginx

EXPOSE 6969

CMD ["nginx", "-g", "daemon off;"]