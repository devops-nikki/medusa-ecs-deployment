FROM node:18

WORKDIR /app

# Install Medusa CLI
RUN npm install -g @medusajs/medusa-cli

# Clone or copy your Medusa backend project
# OR create a new project
RUN medusa new medusa-store --template medusa-starter-default

WORKDIR /app/medusa-store

RUN npm install

EXPOSE 9000

CMD ["npm", "start"]