FROM node:10
WORKDIR /opt/app
COPY package*.json ./
COPY . .
RUN CI=true
# Installs all node packages and dependencies
RUN npm install
EXPOSE 8081
# Finally runs the application
CMD [ "node", "server.js" ]