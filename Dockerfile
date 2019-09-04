FROM node:10.16.3 AS development

RUN mkdir /srv/chat && chown node:node /srv/chat

USER node

WORKDIR /srv/chat

COPY --chown=node:node package.json package-lock.json ./

RUN npm install --quiet

FROM node:10.16.3-slim AS production

USER node

WORKDIR /srv/chat

COPY --from=development --chown=root:root /srv/chat/node_modules ./node_modules

COPY . .

CMD ["node", "index.js"]
