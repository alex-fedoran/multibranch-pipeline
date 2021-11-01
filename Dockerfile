FROM  nginx:stable

MAINTAINER 'Alex Fedoran'

COPY index.html /usr/share/nginx/html/index.html
COPY images /usr/share/nginx/html/images
COPY assets /usr/share/nginx/html/assets
COPY nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
