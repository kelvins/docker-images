# mlflow

![Mlflow: 1.18.0](https://img.shields.io/badge/Mlflow-1.18.0-informational?style=flat-square)

Docker image that runs [Mlflow](https://www.mlflow.org/) server with default support for:

- [PostgreSQL](https://www.postgresql.org/)
- [MySQL](https://www.mysql.com/)
- [MinIO](https://min.io/)
- [Amazon S3](https://aws.amazon.com/s3/)

## Build Docker image

```shell
$ docker build -t mlflow .
```

## Running with docker-compose

The `docker-compose.yaml` is defining the Mlflow service, the PostgreSQL as a database service and the MinIO as a storage service (for artifacts).

To run all services simply run:

```shell
$ docker-compose up
```

After all containers have started you can access the applications:
- **Mlflow**: http://127.0.0.1:5000
- **MinIO**: http://127.0.0.1:9000.

## Testing with Mlflow SDK

To test it locally using the Mlflow Python SDK, you need to follow these steps:

- Make sure all services are up and running (`$ docker-compose up`)
- Make sure you are using a virtual environment
- Enter the `test` directory: `$ cd test`
- Install the dependencies: `$ pip install -r requirements.txt`
- Export the environment variables: `$ source .env`
- Run the Python script: `$ python test_mlflow.py`

If everything goes well, you will see an experiment called `my-experiment` on Mlflow.

> Note that the experiments information will be stored locally in the `./data` directory (PostgreSQL) and the artifacts will be stored locally in the `./storage` directory (MinIO).
