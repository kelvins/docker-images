FROM python:3.9.5-slim-buster

RUN apt-get update && \
    apt-get install --no-install-recommends -qq -y \
    build-essential python3-dev python-mysqldb libpq-dev && \
    rm -rf /var/lib/apt/lists/*

ENV PORT 5000

COPY requirements.txt entrypoint.sh /app/

RUN pip install --no-cache-dir -r /app/requirements.txt && \
    rm /tmp/*.pem

EXPOSE $PORT

ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]

CMD ["bash", "-c", "mlflow server --host 0.0.0.0 --port $PORT --backend-store-uri $BACKEND_STORE_URI --default-artifact-root $ARTIFACT_ROOT"]
