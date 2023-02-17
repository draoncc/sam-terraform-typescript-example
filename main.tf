module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 4.7"

  function_name = "sam-terraform-typescript-example"
  description   = "Example SAM with Terraform Lambda function written in Typescript"

  handler = "index.handler"
  runtime = "nodejs14.x"
  publish = true

  role_path   = "/tf-managed/"
  policy_path = "/tf-managed/"

  source_path = [{
    path = "${path.module}/src"
    commands = [
      "yarn install",
      "yarn build",
      "cd dist",
      ":zip"
    ]
  }]
}
