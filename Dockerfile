FROM osrf/ros:humble-desktop

WORKDIR ~/rs_dev/src

ARG REPO_URL

RUN apt-get update
RUN apt-get install -y git && apt-get install -y python3-pip && apt-get install -y git
RUN git clone "${REPO_URL}" .
RUN [ -f "requirements.txt" ] && pip3 install -r requirements.txt || :  # [1][5]

RUN echo "Done!"