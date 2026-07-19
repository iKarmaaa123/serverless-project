import unittest
from unittest.mock import patch, MagicMock
import sys
sys.path.append("../functions")
from dynamodb import _validate_request, _sending_to_dynamodb
import boto3

class TestDynamodbLambda(unittest.TestCase):

    def test_path(self):
        result = _validate_request("/test", {"user": "user123"}, "user123")
        self.assertEqual(result["statusCode"], 400)

    def test_query_string(self):
        result = _validate_request("/create-user", "", "user123")
        self.assertEqual(result["statusCode"], 400)

    def test_valid_path_parameter(self):
        result = _validate_request("/create-user", {"user": "user123"}, "")
        self.assertEqual(result["statusCode"], 400)

    @patch("dynamodb.dynamodb_client")
    def test_dynamodb_put_item(self, mock_dynamodb_client):
        table_name = "test-table"
        user = "test123"

        mock_dynamodb_client.put_item.return_value = {}

        _sending_to_dynamodb(user, table_name)

        mock_dynamodb_client.put_item.assert_called_once_with(
            TableName=table_name,
            Item={
                "users": {
                    "S": user
                }
            }
        )  

if __name__ == '__main__':
    unittest.main()