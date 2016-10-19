FROM node:6

ENV LOUNGE_VERSION 2.1.0
ENV NODE_ENV production

ENV LOUNGE_HOME "/home/lounge/data"

RUN mkdir -p "${LOUNGE_HOME}"
VOLUME "${LOUNGE_HOME}"

# Install thelounge.
RUN npm install -g thelounge@${LOUNGE_VERSION}
RUN npm cache clean

# Expose HTTP.
ENV PORT 9000
EXPOSE ${PORT}

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
