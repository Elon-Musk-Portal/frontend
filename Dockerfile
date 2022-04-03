FROM node:16.3-alpine as build
WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm ci
RUN npm run build

FROM nginx:1.21.6
COPY --from=build /app/build /usr/share/nginx/html
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]