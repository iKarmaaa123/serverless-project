import logging
import json
import boto3
from typing import Dict
import os

logger = logging.getLogger(__name__)
s3_client = boto3.client("s3", region_name="us-east-1")

def _writing_to_s3(event_data: Dict[str, str], bucket_name: str, key: str):
    try:
        logger.info(f"Writing to {bucket_name} S3 bucket")
        s3_client.put_object(
            Bucket=bucket_name,
            Key=key,
            Body=json.dumps(event_data)
        )
        logger.info(F"Sucessfully wrote data to {bucket_name} S3 bcuket")

    except Exception as e:
        logger.error(f"Failed to write data to S3 bucket: {str(e)}")
        raise 

def lambda_handler(event, context):
    try:
        user_data_bucket = os.environ.get("BUCKET_NAME")
        if not user_data_bucket:
            raise ValueError("Cannot find value for BUCKET_NAME environment variable")

        key = "user-info"

        _writing_to_s3(event, user_data_bucket, key)

        logger.info("Successfully wrote to s3 bucket")

    except Exception as e:
        logger.error(f"Unhandled error: {str(e)}")
        raise