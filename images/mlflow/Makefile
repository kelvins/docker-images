VERSION=1.20.2

.PHONY: build
build:  # Build the docker image
	@docker build -t mlflow .

.PHONY: release
release: build  # Push a new tag to git and docker hub
	@docker tag mlflow kelvinsp/mlflow:$(VERSION)
	@docker push kelvinsp/mlflow:$(VERSION)
	@git tag -a mlflow-v$(VERSION) -m "Mlflow version $(VERSION)"
	@git push --tags
