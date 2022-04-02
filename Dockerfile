FROM node:16.3-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
RUN npm run build

FROM nginx:1.15.10-alpine
COPY --from=build /app/build /var/www
COPY ./nginx/default.conf /etc/nginx/default.conf
CMD ["nginx", "-g", "daemon off;"]