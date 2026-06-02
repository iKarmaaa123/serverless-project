import json
import boto3
import logging

logger = logging.getLogger(__name__)
dynamodb_client = boto3.client("dynamodb")

def validate_request(path: str):
    try:
        if path == "/username":
            logger.info("Valid path")
            return {"statusCode": 200, "body": json.dumps(f"Successful request for ${username}")}
        else:
            logger.error("Invalid path")
            return {"statusCode": 400, "body": json.dumps("Invalid request")}
    except Exception as e:
        logger.error(f"Failed to validate request:{str(e)}")
        raise

def sending_to_dynamodb(username: str):
    tableName = "list_of_usernames"

  try:
    dynamodb_client.put_item(
        TableName=tableName
        Item={
            "username": {
                "S": username
            }
        }
    )
    return {"statusCode": 200, "body": json.dumps("Successfully wrote username to dynamodb table")}
  except Exception as e:
    logger.error(f"Failed to put item in Dynamodb table:{str(e)}")
    raise
    
def lambda_handler(event, context):
  try:
    username_path = event["rawPath"] or "",
    my_username = event["queryStringParameters"]["username"] or ""

    validate_response=validate_request(username_path)

    if validate_response["statusCode"] != 200:
        return validate_response

    validate_username=sending_to_dynamodb(my_username)

    if validate_username["statusCode"] != 200:
        return my_username

    if not my_username:
        return {"statusBody": 400, "body": json.dumps("No username defined")}

    return { "statusCode": 200, "body": json.dumps("OK")}

  except Exception as e:
    logger.exception("Unhandled error")
    return {"status": 502, "body": json.dumps("Internal Server Error")}