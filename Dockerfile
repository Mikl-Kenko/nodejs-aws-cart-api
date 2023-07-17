FROM node:alpine as start
WORKDIR /app

FROM start as dependencies
WORKDIR /app
COPY package*.json ./
RUN npm install
    # && npm cache clean --force

FROM dependencies as build
WORKDIR /app
COPY . .
RUN npm run build

EXPOSE 4000

CMD [ "node", "dist/main.js" ]
