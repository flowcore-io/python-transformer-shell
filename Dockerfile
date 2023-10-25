FROM flowcoreio/adapter-nodejs-transformer-shell:2.1.0

USER root
# install python3
ENV PYTHONUNBUFFERED=1

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

ENV HOOK_PRE_LOAD="python -m venv .venv"
ENV TRANSFORMER_DEPENDENCY_COMMAND="source .venv/bin/activate && pip install --isolated -r requirements.txt"
ENV TRANSFORMER_DEPENDENCY_FILE="requirements.txt"
ENV TRANSFORMER_RUN_COMMAND="source .venv/bin/activate && python {}"
ENV TRANSFORMER_BASE_URL="http://127.0.0.1"
ENV TRANSFORMERS="python"

USER node
