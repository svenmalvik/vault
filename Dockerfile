FROM alpine:3.3

ENV VAULT_VERSION 0.5.2
ENV VAULT_TMP /tmp/vault.zip
ENV VAULT_HOME /usr/local/bin
ENV PATH $PATH:${VAULT_HOME}

RUN apk --update add --no-cache curl wget zip unzip bash && rm -rf /var/cache/apk/*
RUN wget --quiet --output-document=${VAULT_TMP} https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip &&\
	unzip ${VAULT_TMP} -d ${VAULT_HOME} &&\
	rm -f ${VAULT_TMP}

EXPOSE 8200

ENTRYPOINT ["/usr/local/bin/vault"]
CMD ["version"]

