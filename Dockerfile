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
ENV BASEROW_PUBLIC_URL=http://cl1jwsmas00043862lk85cxbc.demo.coolify.io/

#ARG FROM_IMAGE=baserow/baserow:1.9.1
# This is pinned as version pinning is done by the CI setting FROM_IMAGE.
# hadolint ignore=DL3006
#FROM $FROM_IMAGE as image_base

#RUN apt-get remove -y postgresql postgresql-contrib redis-server

#ENV DATA_DIR=/baserow/data
# We have to build the data dir in the docker image as Caddy does not allow it in their
# runtime filesystem. We chown to their www-data user's uid and gid at the end.
#RUN mkdir -p "$DATA_DIR" && \
#    chown -R 9999:9999 "$DATA_DIR"

#COPY deploy/heroku/heroku_env.sh /baserow/supervisor/env/heroku_env.sh

#ENTRYPOINT []
#CMD []
