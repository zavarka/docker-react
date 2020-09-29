FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm run install
COPY . .
RUN npm run build

FROM nginx as deployer
COPY --from=builder /app/build /usr/share/nginx/html