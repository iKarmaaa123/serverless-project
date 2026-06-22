import logger
import json
import boto3

logger = logging.getLogger(__name__)
s3_client = boto3.client('s3')

def _writing_to_s3(event_data: dict, bucket_name: str, key: str):
    try:
        logger.info(f"Writing to {bucket_name} S3 bucket")
        s3_client.put_object(
            Bucket=bucket_name
            Key=key
            Body=event_data
        )
        return {"statusCode": 200, "body": json.dumps(f"Sucessfully wrote data to {bucket_name} S3 bcuket")}
    except Exception as e:
        logger.error(f"Failed to write data to S3 bucket: {str(e)}")
        raise

def lambda_handler(event, context):
    try:
        user_data_bucket = "user_data"
        key = "user_info"

        _writing_to_s3_resp = writing_to_s3(event, user_data_bucket, key)

        if writing_to_s3_resp["statusCode"] != 200:
            return writing_to_s3_resp

        logger.info("Successfully processed event")

    except Exception as e:
        logger.error(f"Unhandled error: {str(e)}")
        return {"statusCode": 502, "body": json.dumps("Internal Server Error")}