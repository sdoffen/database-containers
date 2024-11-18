FROM mcr.microsoft.com/mssql/server:latest

# Switch to root user to perform privileged operations
USER root

# Create the config directory
RUN mkdir -p /usr/config

# Copy the initialization scripts to the config directory
COPY ./init-db /usr/config

# Grant execution permissions for the scripts
RUN chmod +x /usr/config/entrypoint.sh
RUN chmod +x /usr/config/configure.sh

# Switch back to the default mssql user
USER mssql

# Set the working directory and entry point
WORKDIR /usr/config
ENTRYPOINT ["./entrypoint.sh"]
