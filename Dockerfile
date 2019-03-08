# Use version tag to avoid unwanted changes
FROM      swift:4.2
# Set working directory, all files copies here
WORKDIR   /app
COPY      apt-vapor.sh /app/
# Vapor repository add from http://apt.vapor.sh
RUN       bash ./apt-vapor.sh
# Install dev packages
RUN       apt-get update && apt-get install -y libmysqlclient-dev vapor
# Copy files not excluded in dockerignore-file
ADD       . /app/
# Build code
RUN       vapor build
EXPOSE    9000
# Start command
CMD       vapor run serve
