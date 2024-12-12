FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        software-properties-common && \
    add-apt-repository ppa:openrct2/master && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        openrct2 && \
    rm -rf /var/lib/apt/lists/*

# Set up a non-root user that matches the host's UID and GID
ARG USERNAME=$USER # Set this to be the same user as you run the container under
ARG UID=1000
ARG GID=1000

# Create the group and user only if they don't already exist
RUN getent group ${GID} || groupadd -g ${GID} ${USERNAME} && \
    id -u ${UID} &>/dev/null || useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USERNAME} && \
    mkdir -p /home/${USERNAME} && \
    chown -R ${USERNAME}:${GID} /home/${USERNAME}

# Switch to the created user
USER ${USERNAME}

# Set the working directory
WORKDIR /home/${USERNAME}
