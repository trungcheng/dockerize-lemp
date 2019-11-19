FROM nginx:latest

MAINTAINER Đinh Trung <trungdn.dev@gmail.com>

COPY ./sources /var/www/html
COPY default.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443
