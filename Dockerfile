# Build phase to create React app
FROM node:alpine as node
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
CMD ["yarn", "build"]

# Run phase to create nginx server
FROM nginx
EXPOSE 80
COPY --from=node usr/src/app/build /usr/share/nginx/html