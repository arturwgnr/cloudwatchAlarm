terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
} 

resource "aws_sns_topic" "user_updates" {
  name = "user-updates-topic"
}

resource "aws_sns_topic_subscription" "user_updates_subscription" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol = "email"
  endpoint = "arturwagner99@hotmail.com"
}

resource "aws_cloudwatch_metric_alarm" "wizard_alarm" {
  alarm_name = "terraform_wizard_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
  alarm_actions = [aws_sns_topic.user_updates.arn]
  dimensions = {
    InstanceId = "i-098af076deb8a665e" 
  }
}