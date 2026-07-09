import json
import boto3
import logging

logger = logging.getLogger(__name__)
dynamodb_client = boto3.client("dynamodb")

def _validate_request(path):
    try:
        if path == "/create-user":
            return {"statusCode": 200, "body": json.dumps(f"{path} is a valid path")}
        elif path != "/create-user":
            return {"statusCode": 400, "body": json.dumps(f"{path} is an invalid path")}
        else:
            return {"statusCode": 400, "body": json.dumps(f"No {path} was passed in")}

    except Exception as e:
        logger.error(f"Failed to validate request: {str(e)}")
        raise

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
        return {"statusCode": 200, "body": json.dumps("Successfully wrote user to dynamodb table")}

    except Exception as e:
      logger.error(f"Failed to write item to Dynamodb table: {str(e)}")
      raise
    
def lambda_handler(event, context):
    try:
        user_path = event.get("path", "")
        dynamodb_table_name = "users-table"
        query_string = event.get("queryStringParameters")
        my_user = query_string.get("user", "")

        if not query_string:
            return {"statusCode": 400, "body": json.dumps("No path parameters were passed in")}

        if not my_user:
            return {"statusCode": 400, "body": json.dumps("Either no path parameter was passed or an invalid path parameter was passed in")}

        validate_path_resp = _validate_request(user_path)
 
        if validate_path_resp["statusCode"] != 200:
            return validate_path_resp

        validate_sending_to_dynamodb = _sending_to_dynamodb(my_user, dynamodb_table_name)

        if validate_sending_to_dynamodb["statusCode"] != 200:
            return validate_sending_to_dynamodb

        return {"statusCode": 200, "body": json.dumps("Successfully wrote to DynamoDB table")}

    except Exception as e:
        logger.error(f"Unhandled error: {str(e)}")
        return {"statusCode": 502, "body": json.dumps("Internal Server Error")}