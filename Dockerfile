FROM node:alpine as builder
workdir '/app'
copy package.json .
run npm install
copy . .
run npm run build

FROM nginx 
copy --from=builder /app/build /usr/share/nginx/html

