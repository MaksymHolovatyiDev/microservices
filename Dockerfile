FROM node:18

WORKDIR /app

RUN npm install -g @nestjs/cli

COPY package*.json ./

RUN npm install

COPY . .

RUN cd submodules/api-public && npm install
RUN cd submodules/news-service && npm install

RUN npm run build

CMD [ "npm", "run", "start:dev" ]