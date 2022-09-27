provider "aws" {
    profile = "tf-user"
    region = var.healthcheckregion
}

resource "aws_cloudwatch_metric_alarm" "foobar" {
    alarm_name = "sitehealthcheck"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "HealthCheck"
    namespace = "AWS/EC2"
    period = "120"
    statistic = "Average"
    threshold = "80"
    alarm_description = "The metric monitors system health status"
}

resource "aws_route53_health_check" "foo" {
    type = "HTTP"
    cloudwatch_alarm_name = aws_cloudwatch_metric_alarm.foobar.alarm_name
    cloudwatch_alarm_region = var.healthcheckregion
    insufficient_data_health_status = "Healthy"
    fqdn = var.healthcheckurl
    port = var.healthcheckport
    resource_path = "/"
    failure_threshold = "5"
    request_interval = "30"

    tags = {
        Name = var.healthcheckurl
    }
}