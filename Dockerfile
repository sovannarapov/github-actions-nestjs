# Use a lightweight Node.js image
FROM node:21-alpine

# Set the working directory
WORKDIR /usr/src/github-actions-nestjs-app

# Copy only package.json and yarn.lock for dependency installation
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy the rest of the application code
COPY . .

# Build the application
RUN yarn build

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["yarn", "start"]
