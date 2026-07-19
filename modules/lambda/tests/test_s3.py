import unittest
from unittest.mock import patch, MagicMock
import sys
import json
sys.path.append("../functions")
from s3 import _writing_to_s3
import boto3

class TestS3Lambda(unittest.TestCase):

    @patch("s3.s3_client")
    def test_s3_put_object(self, mock_s3_client):
        event = {"username": "test123", "id": "393809832"}
        bucket_name = "test-bucket"
        key = "test-key"

        mock_s3_client.put_object.return_value = {}

        _writing_to_s3(event, bucket_name, key)

        mock_s3_client.put_object.assert_called_once_with(
            Bucket=bucket_name,
            Key=key,
            Body=json.dumps(event)
        )

if __name__ == '__main__':
    unittest.main()