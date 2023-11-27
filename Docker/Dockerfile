# Stage 1: Build Node.js application
FROM mcr.microsoft.com/windows/servercore:ltsc2019 AS builder

# Download and install Node.js
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-WebRequest -OutFile nodejs.msi -Uri https://nodejs.org/dist/v14.17.5/node-v14.17.5-x64.msi; \
    Start-Process -Wait -FilePath msiexec -ArgumentList '/i', 'C:\app\nodejs.msi', '/quiet', '/norestart'

# Use an official MySQL runtime as a parent image
FROM mysql:latest

# Set the root password for MySQL
ENV MYSQL_ROOT_PASSWORD=password

# Create a database and user for Node.js application
ENV MYSQL_DATABASE=MusicDatabase
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=password

# Copy package.json and package-lock.json to the container
COPY app .
# Install Node.js dependencies
RUN npm install
# Copy the Node.js application files to the container
COPY . .

WORKDIR /Frontend
RUN npm install
RUN npm run build

# Expose the Node.js application port
EXPOSE 3000

# Expose the MySQL port
EXPOSE 3306


WORKDIR ../
CMD ["node", "app.js"]
