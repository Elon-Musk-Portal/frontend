FROM node:16.3-alpine as build
WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm ci
RUN npm run build
