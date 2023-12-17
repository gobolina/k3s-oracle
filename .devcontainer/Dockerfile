FROM mcr.microsoft.com/devcontainers/base:bookworm

ENV TOFU_VERSION="1.6.0-alpha2"
ENV KUBECTL_VERSION="v1.29.0"

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends wget unzip python3 python3-pip \
    && OS="$(uname | tr '[:upper:]' '[:lower:]')" \
    && ARCH="$(uname -m | sed -e 's/aarch64/arm64/' -e 's/x86_64/amd64/')" \
    && wget "https://github.com/opentofu/opentofu/releases/download/v${TOFU_VERSION}/tofu_${TOFU_VERSION}_${OS}_${ARCH}.zip" \
    && unzip "tofu_${TOFU_VERSION}_${OS}_${ARCH}.zip" \
    && mv tofu /usr/local/bin/tofu \ 
    && rm "tofu_${TOFU_VERSION}_${OS}_${ARCH}.zip" \
    && curl -sSL -o /usr/local/bin/kubectl "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${ARCH}/kubectl" \
    && chmod 0755 /usr/local/bin/kubectl \
    &&  pip install oci-cli --break-system-packages
