FROM flowcoreio/adapter-nodejs-transformer-shell:1.5.0

USER root
# install python3
RUN apk add --no-cache python3

ENV TRANSFORMER_DEPENDENCY_COMMAND="pip3 install --no-cache-dir -r requirements.txt"
ENV TRANSFORMER_DEPENDENCY_FILE="requirements.txt"
ENV TRANSFORMERS="python"

USER node