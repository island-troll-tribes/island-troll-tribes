FROM suchja/wine

USER root

ARG POWERSHELL_VERSION=6.0.2

# Setup the locale
ENV LANG en_US.UTF-8
ENV LC_ALL $LANG

# Install dependencies and clean up
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-utils \
        ca-certificates \
        curl \
        apt-transport-https \
    && rm -rf /var/lib/apt/lists/*

# Import the public repository GPG keys for Microsoft
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

# Register the Microsoft Ubuntu 14.04 repository
RUN curl https://packages.microsoft.com/config/ubuntu/14.04/prod.list | tee /etc/apt/sources.list.d/microsoft.list

# Install powershell from Microsoft Repo
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
	powershell

USER xclient

RUN wine wineboot --init
