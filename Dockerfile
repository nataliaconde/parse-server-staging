# Use the latest Node.js official image
FROM node:latest

# Install Redis inside the container
RUN apt-get update && \
    apt-get install -y redis-server && \
    rm -rf /var/lib/apt/lists/*

# Create a working directory
WORKDIR /app

# Copy project files into the container
ADD . /app

# Install dependencies
RUN npm install

# Expose the Parse Server port and Redis port
EXPOSE 1337

# Start both Redis and the Node.js app
CMD ["sh", "-c", "redis-server --daemonize no & npm start"]