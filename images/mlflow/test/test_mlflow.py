import os

import mlflow


mlflow.set_experiment('my-experiment')

with open('features.txt', 'w') as f:
    f.write('rooms, zipcode, median_price')

params = {'learning_rate': 0.05}
metrics = {'accuracy': 0.92}

with mlflow.start_run() as run:
    mlflow.log_params(params)
    mlflow.log_metrics(metrics)
    mlflow.set_tag('version', '0.1.0')
    mlflow.log_artifact('features.txt', artifact_path='features')

os.remove('features.txt')
