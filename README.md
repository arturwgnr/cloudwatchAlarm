# CloudWatch Alarms with Terraform

Active monitoring of EC2 instances with automated email alerts.

## 🎯 Objective
Prevent unmonitored infrastructure in production environments. This project implements automated observability for EC2 instances, triggering alerts via SNS whenever CPU usage exceeds critical thresholds, without any manual clicks in the AWS Console.

## 🛠️ Resources Created
- **aws_sns_topic**: Notification channel to centralize alerts.
- **aws_sns_topic_subscription**: Email subscription to the notification channel.
- **aws_cloudwatch_metric_alarm**: Alarm monitoring the `CPUUtilization` metric of the EC2 instance.

## 🔄 Alert Workflow
EC2 CPU >= 80% ➡️ CloudWatch Detects ➡️ SNS Topic ➡️ Email Alert

## 📂 Project Structure
cloudwatch-alarm/
├── main.tf        # Main Terraform configuration
└── .gitignore     # Blocks local Terraform files and state files

## 🚀 How to Run

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Validate and Plan:**
   ```bash
   terraform plan
   ```

3. **Deploy the Infrastructure:**
   ```bash
   terraform apply
   ```

## ⚠️ Important Note
After running `terraform apply`, AWS will send a confirmation email to the configured address. The alarm will only deliver real alerts after you **manually confirm** the subscription by clicking the link in that email.
