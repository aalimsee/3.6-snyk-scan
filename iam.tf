data "aws_iam_policy_document" "inline_policy_cloudwatch" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    resources = ["arn:aws:logs:us-east-1:255945442255:log-group:/aws/lambda/${var.lambda_function_name}:*"]
  }
}

# Warning: iam.tf:1:1: Warning - data "aws_iam_policy_document" "inline_policy_cloudwatch" is declared but not used (terraform_unused_declarations)
resource "aws_iam_policy" "cloudwatch_policy" {
  name   = "CloudWatchPolicy"
  policy = data.aws_iam_policy_document.inline_policy_cloudwatch.json
}


data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = var.iam_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}