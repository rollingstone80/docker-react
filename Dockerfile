# Build phase to create React app
FROM node:alpine as build

WORKDIR /app

COPY ./package.json /app/package.json
# COPY ./package-lock.json /app/package-lock.json

RUN yarn install
COPY . .
RUN yarn build

# Run phase to create nginx server
FROM nginx
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html