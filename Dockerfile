FROM runatlantis/atlantis

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN curl -LO https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-07-26/bin/linux/amd64/aws-iam-authenticator
RUN curl -LO https://storage.googleapis.com/kubernetes-helm/helm-v2.14.1-linux-amd64.tar.gz
RUN tar -xzf helm-v2.14.1-linux-amd64.tar.gz
RUN chmod +x linux-amd64/helm && mv linux-amd64/helm /usr/local/bin/helm
RUN chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
RUN chmod +x ./aws-iam-authenticator && mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator
USER atlantis
RUN helm init --client-only