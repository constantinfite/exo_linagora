# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy all app files to the container's working directory
COPY . .

# Build the Vue.js app for production
RUN npm run build

# Expose port 8080 for the app
EXPOSE 8080

# Start the app
CMD [ "npm", "run", "start" ]
