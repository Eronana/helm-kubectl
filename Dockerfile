FROM alpine:3.12

ENV KUBE_VERSION="v1.13.4"
ENV HELM_VERSION="v3.6.3"

RUN apk add --no-cache ca-certificates bash gettext \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzp && mv linux-amd64/helm /usr/local/bin/ \
    && rm -rf linux-amd64

CMD ["/bin/bash"]
