FROM node:18-alpine

USER node

WORKDIR /home/node/app

COPY --chown=node:node package*.json ./

ENV NODE_ENV production

RUN yarn install --frozen-lockfile

COPY --chown=node:node . .

RUN yarn build

# Start the server using the production build
CMD [ "node", "dist/main.js" ]