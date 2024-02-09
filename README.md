# Serverless FastAPI

Basic usage of FastAPI with Mangum for AWS Lambda.

To build a docker image for packaging the application, run the following commands:

```bash
docker build -t serverless-fastapi .
docker run -v $(pwd):/app/out --rm -it serverless-fastapi
```

If you setup your lambda with IAM auth - you can still use cURL to test your API:

```bash
curl https://[replace-your-url].lambda-url.[replace-aws-region].on.aws --header 'Content-Type: application/json' \
--aws-sigv4 "aws:amz:[replace-aws-region]:lambda" --user [YOU-ACCESS-KEY]:[YOUR-SECRET]
```

OR you can use this cool tool called [awscurl](https://github.com/okigan/awscurl) [`pipx install awscurl`]:

```bash
awscurl --region [REPLACE-REGION] --service lambda https://[REPLACE-URL].lambda-url.[REPLACE-REGION].on.aws
```
