provider "aws" {
  region = "${var.region}"
}

data "aws_caller_identity" "current" {}

output "account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

data "aws_iam_policy_document" "sns_topic_policy" {
  policy_id = "__default_policy_ID"

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        "${data.aws_caller_identity.current.account_id}",
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      "${aws_sns_topic.sns_alert_topic.arn}",
    ]

    sid = "__default_statement_ID"
  }
}

resource "aws_sns_topic" "sns_alert_topic" {
  name = "hawkeye_alert"
}

resource "aws_sns_topic_policy" "sns_policy" {
  arn    = "${aws_sns_topic.sns_alert_topic.arn}"
  policy = "${data.aws_iam_policy_document.sns_topic_policy.json}"
}

resource "aws_sns_topic_subscription" "sns_topic_subscription" {
  topic_arn = "${aws_sns_topic.sns_alert_topic.arn}"
  protocol  = "sms"
  endpoint  = "${var.phone_number}"
}
