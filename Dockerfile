FROM node:16.3-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.21.6
COPY --from=build /app/build /var/www
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY /etc/letsencrypt/ /etc/letsencrypt/
EXPOSE 80
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]