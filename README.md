# Mlflow Image

Docker image that runs [Mlflow](https://www.mlflow.org/) server using [PostgreSQL](https://www.postgresql.org/) as database and [MinIO](https://min.io/) as storage (for artifacts).

## Build Docker image

```sh
$ docker build -t mlflow .
```

## Running with docker-compose

```sh
$ docker-compose up
```

After all containers have started you can access the applications:
- **Mlflow**: http://127.0.0.1:5000
- **MinIO**: http://127.0.0.1:9000.

## Testing with Mlflow SDK

To test it locally using the Mlflow Python SDK, you need to follow these steps:

- Make sure you are using a virtual environment (I recommend [pyenv](https://github.com/pyenv/pyenv))
- Install the `mlflow` and `boto3` packages (e.g. `$ pip install mlflow`)
- Enter the `test` directory: `$ cd test`
- Export the environment variables: `$ source .env`
- Run the Python script: `$ python test_mlflow.py`

If everything goes well, you will see an experiment called `my-experiment` on Mlflow.
