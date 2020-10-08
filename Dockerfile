FROM node:12
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
RUN npm install -g coffeescript

COPY . .

EXPOSE 8080

CMD ["coffee", "bot_three/index.coffee"]