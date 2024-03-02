FROM node:10  as build

WORKDIR /app

COPY  package.json ./

RUN npm install

COPY . .

RUN npm run build

###############
FROM nginx:1.20

COPY --from=build /app/dist/angular-dashboard-ui /usr/share/nginx/html

EXPOSE 80


