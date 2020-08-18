# build phase
FROM node:alpine as builder 
WORKDIR '/app'
COPY package*.json ./
#COPY .npmrc .
RUN npm install
COPY . .
RUN npm run build

#run phase
FROM nginx
EXPOSE 80
#copy the node_modules dependencies
COPY --from=0 /app/build /usr/share/nginx/html
