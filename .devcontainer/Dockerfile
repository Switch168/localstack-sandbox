ARG JAVA_VERSION="17"
FROM amazoncorretto:${JAVA_VERSION}

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN yum install -y shadow-utils tar
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && yum update -y \
    && yum install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************
# Add IaC Tools
# RUN yum install -y yum-utils shadow-utils \
#     && yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo \
#     && yum -y install terraform

# RUN arch=$(arch | sed s/aarch64/arm64/ | sed s/x86_64/amd64/) && \
#     wget "http://...../${arch}.deb"


RUN yum install -y python3 wget \
    && pip3 install awscli --upgrade
# TODO: arm and x86 only 
RUN wget https://releases.hashicorp.com/terraform/1.3.6/terraform_1.3.6_linux_arm64.zip
RUN sudo mv terraform /usr/local/bin/

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME