FROM node:16.3-alpine as build
WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm ci
RUN npm run build

FROM nginx:1.21.6-alpine
COPY ../dev-ops/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /usr/share/nginx/html
ENTRYPOINT ["nginx", "-g", "daemon off;"]
