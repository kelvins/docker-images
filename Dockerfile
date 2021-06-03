FROM python:3.9.5-slim-buster

RUN apt-get update && apt-get install -qq -y \
    build-essential python3-dev python-mysqldb libpq-dev

COPY . /tmp

RUN pip install -r /tmp/requirements.txt

EXPOSE 5000

ENTRYPOINT ["/bin/bash", "/tmp/entrypoint.sh"]

CMD ["bash", "-c", "mlflow server --host 0.0.0.0 --port 5000 --backend-store-uri $BACKEND_STORE_URI --default-artifact-root $ARTIFACT_ROOT"]
