# Serverless FastAPI

Basic usage of FastAPI with Mangum for AWS Lambda.

To build a docker image for packaging the application, run the following commands:

```bash
docker build -t serverless-fastapi .
docker run -v $(pwd):/app/out --rm -it serverless-fastapi
```
