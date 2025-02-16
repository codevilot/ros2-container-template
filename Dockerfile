FROM osrf/ros:humble-desktop

WORKDIR /root/rs_dev/src

ARG REPO_URL
ARG GIT_NAME
ARG GIT_EMAIL
ARG GIT_PRIVATE_TOKEN

# Extract repository path without domain
ARG REPO_URL_CLEAN=${REPO_URL#https://github.com/}
ARG REPO_URL_CLEAN=${REPO_URL_CLEAN#http://github.com/}
ARG REPO_URL_CLEAN=${REPO_URL_CLEAN#github.com/}
ARG REPO_DIR=${REPO_URL_CLEAN##*/}  # Get repository name

RUN apt-get update && \
    apt-get install -y git python3-pip

RUN git config --global user.name "${GIT_NAME}" && \
    git config --global user.email "${GIT_EMAIL}"

# Clone repository
RUN if [ -n "${GIT_PRIVATE_TOKEN}" ]; then \
    git clone "https://${GIT_PRIVATE_TOKEN}:x-oauth-basic@github.com/${REPO_URL_CLEAN}"; \
    else \
    git clone "https://github.com/${REPO_URL_CLEAN}"; \
    fi

# Move to repository directory
WORKDIR /root/rs_dev/src/${REPO_DIR}

# Install requirements (now in correct directory)
RUN if [ -f "requirements.txt" ]; then pip3 install -r requirements.txt; fi

# Install tools and configure pre-commit
RUN pip3 install pipreqs pre-commit && \
    git config --global --add safe.directory "$(pwd)" && \
    pre-commit install

# Optional: Return to original directory
WORKDIR /root/rs_dev/src
