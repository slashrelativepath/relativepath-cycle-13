FROM ubuntu

COPY webserver.sh /webserver.sh

RUN apt update && apt install -y  sudo

RUN chmod +x webserver.sh && /webserver.sh

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

