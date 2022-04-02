#FROM node:16.3-alpine as build
#WORKDIR /app
#COPY package*.json ./
#RUN npm install
#COPY . .
#EXPOSE 3000
#CMD [ "npm", "start" ]

FROM node:11.13 as builder

RUN mkdir /app
WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json /app/package.json
RUN npm install
RUN npm install react-scripts@2.1.8 -g

COPY ./package-lock.json /app
COPY ./public /app/public
COPY ./src /app/src

RUN npm run build

FROM nginx:1.15.10-alpine
COPY --from=builder /app/build /var/www
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]