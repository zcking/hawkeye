import os
import socket

import boto3


REGION = os.environ.get('AWS_REGION', 'us-east-1')
SNS = boto3.client('sns', region_name=REGION)
TOPIC_ARN = os.environ['HAWKEYE_SNS_TOPIC']

ALERT_INTRUSION = 'intrusion'


def alert(msg, service, alert_type):
    """
    Publishes a message to the SNS topic.
    """
    msg_attrs = {
        'service': {
            'DataType': 'String',
            'StringValue': service
        },
        'alert_type': {
            'DataType': 'String',
            'StringValue': alert_type
        }
    }
    SNS.publish(TopicArn=TOPIC_ARN, Message=msg, MessageAttributes=msg_attrs)


def machine():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(("8.8.8.8", 80))
    mach = s.getsockname()[0]
    s.close()
    return mach
