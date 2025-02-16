FROM osrf/ros:humble-desktop

WORKDIR ~/rs_dev/src

ARG REPO_URL
ARG GIT_NAME
ARG GIT_EMAIL
ARG GIT_PRIVATE_TOKEN

RUN apt-get update
RUN apt-get install -y git && apt-get install -y python3-pip

RUN git config --global user.name "$GIT_NAME" && \
    git config --global user.email "$GIT_EMAIL"

# GIT_PRIVATE_TOKEN이 있으면 token을 사용해서 클론하고, 없으면 기본 URL로 클론
RUN if [ -n "$GIT_PRIVATE_TOKEN" ]; then \
        git clone "https://${GIT_PRIVATE_TOKEN}@github.com/${REPO_URL}"; \
    else \
        git clone "https://github.com/${REPO_URL}"; \
    fi

RUN [ -f "requirements.txt" ] && pip3 install -r requirements.txt || :  # [1][5]

RUN pip3 install pipreqs && pip3 install pre-commit 
RUN pre-commit install

RUN echo "Done!"
