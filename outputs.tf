output "sns_topic_arn" {
  value = "${aws_sns_topic.sns_alert_topic.arn}"
}
