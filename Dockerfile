FROM node:10.16.3

RUN mkdir /srv/chat && chown node:node /srv/chat

USER node

WORKDIR /srv/chat

COPY --chown=node:node package.json package-lock.json ./

RUN npm install --quiet

# TODO: Can remove once we have some dependencies in package.json.
RUN mkdir -p node_modules
