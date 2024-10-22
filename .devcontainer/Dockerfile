# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.2/containers/codespaces-linux/.devcontainer/base.Dockerfile
# 22.04 is ubuntu:jammy
ARG VARIANT=ubuntu-22.04 
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

RUN apt-get update && apt-get -y install --no-install-recommends \
   gcc curl gpg wget software-properties-common \
   pciutils graphviz jsonnet dos2unix

# # https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#install-guide
# RUN curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
#   && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
#     sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
#     tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
# RUN sed -i -e '/experimental/ s/^#//g' /etc/apt/sources.list.d/nvidia-container-toolkit.list
# RUN apt-get update \
#       && apt-get install -y nvidia-container-toolkit \
#       && apt-get upgrade -y

# create global virtual environment using python standard library tools of virtualenv
ARG USER="vscode"

# COPY ./.bashrc /home/${USER}/ 

# Install Flux CLI
RUN curl -s https://fluxcd.io/install.sh | sudo bash

# Install Kustomize
RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash

#### COPY requirements.txt /tmp/
#### COPY .bashrc /home/${USER}/
# RUN /usr/bin/python3 -m venv ${VENV_PATH}
# RUN source ${VENV_PATH}/bin/activate
# RUN ${VENV_PATH}/bin/pip --disable-pip-version-check --no-cache-dir install -r requirements.txt
#### RUN rm -rf /tmp/requirements.txt

# Install Min-io client:
RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc
RUN chmod +x mc
RUN mv mc /usr/local/bin/mc

## RUN virtualenv ${VENV_PATH} \
##   && activate ${VENV_PATH} \
##   && pip install --upgrade pip \
##   && pip install -r requirements.txt

SHELL ["/bin/bash", "-c"]
