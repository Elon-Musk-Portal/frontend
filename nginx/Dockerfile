FROM nginx:1.21.6-alpine
COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=portal-frontend /app/build /usr/share/nginx/html
ENTRYPOINT ["nginx", "-g", "daemon off;"]
