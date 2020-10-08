FROM node:slim

WORKDIR /usr/app/
COPY . .
RUN apt-get -s upgrade | grep -P "\d\K upgraded"
RUN apt update & \
    cd /usr/app/ & \
    npm i & \
    npm update

EXPOSE 30001

CMD ["npm","run","serve","--","--port","30001"]