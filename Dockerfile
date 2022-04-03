FROM node:16.3-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm build
#EXPOSE 3000
#CMD ["npm", "start"]