ARG NUXT_HOST=0.0.0.0
ARG NUXT_PORT=3000
ARG APP_NAME=nuxt
ARG NODE_VERSION=20

FROM node:${NODE_VERSION}-alpine

ENV NUXT_HOST=${NUXT_HOST}
ENV NUXT_PORT=${NUXT_PORT}
ENV APP_NAME=${APP_NAME}

RUN apk add --no-cache bash unzip rsync curl screen nano git
RUN echo "alias ll='ls -lisa'" >> ~/.bashrc

WORKDIR /usr/src/app

COPY init-project.sh /usr/src/app/init-project.sh
COPY . /usr/src/app

EXPOSE ${NUXT_PORT}

ENTRYPOINT ["/usr/src/app/init-project.sh"]