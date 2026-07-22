import json
import boto3
import logging
from typing import Dict

logger = logging.getLogger(__name__)
dynamodb_client = boto3.client("dynamodb", region_name="us-east-1")

def _validate_request(path: str, query_string: Dict[str, str], user: str):
    if path == "":
        return {"statusCode": 400, "body": json.dumps("No path was passed in")}

    elif path != "/create-user":
        return {"statusCode": 400, "body": json.dumps(f"{path} is an invalid path")}
        
    elif not query_string:
        return {"statusCode": 400, "body": json.dumps("No path parameters were passed in")}

    elif not user:
        return {"statusCode": 400, "body": json.dumps("Invalid path parameter was passed in")}
    
    return {"statusCode": 200}
        

def _sending_to_dynamodb(user, table_name):
    try:
        dynamodb_client.put_item(
            TableName=table_name,
            Item={
                "users": {
                    "S": user
                }
            }
        )

    except Exception as e:
      logger.error(f"Failed to write item to Dynamodb table: {str(e)}")
      raise
    
def lambda_handler(event, context):
    try:
        user_path = event.get("path", "")
        dynamodb_table_name = "users-table"
        query_string = event.get("queryStringParameters") or {}
        my_user = query_string.get("user", "")

        validate_user_request = _validate_request(user_path, query_string, my_user)
        
        if validate_user_request["statusCode"] != 200:
            return validate_user_request

        _sending_to_dynamodb(my_user, dynamodb_table_name)

        return {"statusCode": 200, "body": json.dumps("Successfully wrote to DynamoDB table")}

    except Exception as e:
        logger.error(f"Unhandled error: {str(e)}")
        return {"statusCode": 500, "body": json.dumps("Internal Server Error")}
        raise