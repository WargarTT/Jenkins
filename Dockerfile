FROM nginx:latest

RUN apt-get update && apt-get install -y curl

ARG CACHEBUST=1
ADD https://raw.githubusercontent.com/WargarTT/JustBlankSite/main/index.html?${CACHEBUST} /tmp/index.html
RUN chown nginx:nginx /tmp/index.html
RUN mv /tmp/index.html /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]
