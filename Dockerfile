FROM mcr.microsoft.com/mssql/server:2019-CU9-ubuntu-16.04

# Create app directory
RUN mkdir -p /usr/work
WORKDIR /usr/work

# Copy initialization scripts
COPY . /usr/work

# Grant permissions for the run-initialization.sh
USER root
RUN chmod +x /usr/work/run-initialization.sh


# Set environment variables for automation purposes
# Note: Make sure this password is the same as that in entrypoint.sh
ENV SA_PASSWORD AStupidPassword1@
ENV ACCEPT_EULA Y
ENV MSSQL_PID Express

# Expose port 1433 in case accessing from a different container
EXPOSE 1433

# Run Microsoft SQl Server and initialization script (at the same time)
# This overrides the base images use of CMD so that we can initialize the sql server as we wish
# Note: If you want to start MsSQL only (without initialization script) you can comment bellow line out, CMD entry from base image will be taken
CMD /bin/bash ./entrypoint.sh
