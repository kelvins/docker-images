FROM python:3.9.5-slim-buster

RUN apt-get update && apt-get install -qq -y \
    build-essential python3-dev python-mysqldb libpq-dev

ENV PORT 5000

COPY requirements.txt entrypoint.sh /tmp/

RUN pip install -r /tmp/requirements.txt

EXPOSE $PORT

ENTRYPOINT ["/bin/bash", "/tmp/entrypoint.sh"]

CMD ["bash", "-c", "mlflow server --host 0.0.0.0 --port $PORT --backend-store-uri $BACKEND_STORE_URI --default-artifact-root $ARTIFACT_ROOT"]
