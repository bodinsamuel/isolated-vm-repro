FROM node:16.12.0 AS base

ENV NODE_ENV production

# Install dependencies
# python make and g++ are needed for native deps
RUN apt-get update && apt-get install -y bash python3 make g++ gdb

# Setup the app WORKDIR
WORKDIR /app

COPY package.json yarn.lock ./

# Install dev dependencies
RUN true \
  && yarn install --production=false

COPY . /app
RUN ls -lah /app

FROM node:16.12.0 as final

RUN apt-get install -y bash curl openssl

# Do not use root to run the app
USER node

WORKDIR /app

COPY --from=base --chown=node:node /app /app

EXPOSE 8000

CMD [ "node", "index.js" ]
