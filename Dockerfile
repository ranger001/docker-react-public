# build phase
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
COPY .npmrc .
RUN npm install
COPY . .
RUN npm run build

#run phase
FROM nginx
#copy the node_modules dependencies
COPY --from=builder /app/build /usr/share/nginx/html
