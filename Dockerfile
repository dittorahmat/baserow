FROM baserow/baserow:1.9.1

# Any .sh files found in /baserow/supervisor/env/ will be sourced and loaded at startup
# useful for storing your own environment variable overrides.
#COPY custom_env.sh /baserow/supervisor/env/custom_env.sh

# Set the DATA_DIR environment variable to change where Baserow stores its persistant 
# data. At startup Baserow will attempt to chown and setup this folder correctly.
ENV DATA_DIR=/baserow/data
VOLUME ["baserow_data:/baserow/data"]

# This image bakes in its own default user with UID/GID of 9999:9999 by default. To
# Set this to change the user Baserow will run its Caddy, backend, Celery and 
# web-frontend services as. However be warned, the default entrypoint needs to be run 
# as root so using USER may break things.
ENV DOCKER_USER=baserow_docker_user
