# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/engine/reference/builder/

ARG NODE_VERSION=4.0.0

FROM node:${NODE_VERSION}

# Use production node environment by default.
ENV NODE_ENV production


WORKDIR /usr/src/app

COPY package*.json ./

# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.npm to speed up subsequent builds.
# Leverage a bind mounts to package.json and package-lock.json to avoid having to copy them into
# into this layer.


# Run the application as a non-root user.

# Copy the rest of the source files into the image.
COPY . .

RUN npm install 
# Expose the port that the application listens on.
EXPOSE 5000

# Run the application.
CMD npm start
