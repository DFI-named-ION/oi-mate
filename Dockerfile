FROM alpine:latest
RUN apk add --no-cache nginx
RUN mkdir -p /run/nginx /usr/share/nginx/html /etc/nginx
COPY index.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
