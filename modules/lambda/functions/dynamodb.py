import json
import boto3
import logging

logger = logging.getLogger(__name__)
dynamodb_client = boto3.client("dynamodb")

def _validate_request(path):
    try:
        if path == "/username":
            return {"statusCode": 200, "body": json.dumps(f"{path} is a valid path")}
        else:
            return {"statusCode": 400, "body": json.dumps(f"{path} is an invalid path")}

    except Exception as e:
        logger.error(f"Failed to validate request: {str(e)}")
        raise

def _sending_to_dynamodb(username, table_name):
    try:
        dynamodb_client.put_item(
            TableName=table_name,
            Item={
                "username": {
                    "S": username
                }
            }
        )
        return {"statusCode": 200, "body": json.dumps("Successfully wrote username to dynamodb table")}

    except Exception as e:
      logger.error(f"Failed to write item to Dynamodb table: {str(e)}")
      raise
    
def lambda_handler(event, context):
    try:
        logger.info(event)
        username_path = event.get("path")
        dynamodb_table_name = "username-dynamodb-table"
        query_string = event.get("queryStringParameters") or {}

        if not query_string:
            return {"statusCode": 400, "body": json.dumps("No path parameters were passed in")}

        my_username = query_string["user"]

        if not my_username:
            return {"statusCode": 400, "body": json.dumps("Missing username query parameter")}

        validate_path_resp = _validate_request(username_path)
 
        if validate_path_resp["statusCode"] != 200:
            return validate_path_resp

        validate_sending_to_dynamodb = _sending_to_dynamodb(my_username, dynamodb_table_name)

        if validate_sending_to_dynamodb["statusCode"] != 200:
            return validate_sending_to_dynamodb

        return {"statusCode": 200, "body": json.dumps("Event processed successfully")}

    except Exception as e:
        logger.error(f"Unhandled error: {str(e)}")
        return {"statusCode": 502, "body": json.dumps("Internal Server Error")}