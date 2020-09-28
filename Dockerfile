FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

FROM nginx as deployer
COPY --from=builder /app/build /usr/share/nginx/html