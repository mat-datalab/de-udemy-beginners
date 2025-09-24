# Makefile: skróty dla najczęstszych zadań

.PHONY: setup format lint test run-example

setup:
	python -m venv .venv && . .venv/bin/activate && pip install -r requirements.txt && pre-commit install

format:
	black .
	isort .

lint:
	flake8 .

test:
	pytest -q

run-example:
	python src/python/etl/example_spark_job.py --input data/raw/example.csv --output data/processed/example_output.parquet
