FROM node:16.2
RUN apt-get update && apt-get upgrade -y
RUN mkdir -p /var/www/html/my-porto
WORKDIR /var/www/html/my-porto
COPY . .
RUN npm install
RUN npm run build

CMD [ "npm", "start" ]

# FROM node:16.2
# RUN mkdir -p /var/www/html/my-porto
# WORKDIR /var/www/html/my-porto
# RUN apt-get update && apt-get upgrade
# COPY . /var/www/html/my-porto
# RUN npm install
# RUN npm run build

# CMD [ "npm", "run", "start" ]