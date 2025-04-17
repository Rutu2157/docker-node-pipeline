FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Copy app files
COPY package*.json ./
RUN npm install
COPY . .

# Expose app port
EXPOSE 8082

# Start the app
CMD ["npm", "start"]
