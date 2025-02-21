FROM osrf/ros:humble-desktop

ARG WORK_DIR

# 기본 작업 디렉토리 설정 (WORK_DIR이 없으면 기본값으로 /root 사용)
ENV WORK_DIR=${WORK_DIR:-/root}



WORKDIR ${WORK_DIR}

RUN echo "Using WORK_DIR: ${WORK_DIR}"

RUN apt-get update && \
    apt-get install -y git python3-pip


# Install requirements (now in correct directory)
RUN if [ -f "requirements.txt" ]; then pip3 install -r requirements.txt; fi
