provider "aws" {
    region = "us-east-2"

}




# Using count 

// resource "aws_iam_user" "example"{
//     count = length(var.user_names)
//     name = var.user_names[count.index]
// }


#using for_each loop and for_each supports only sets and maps
resource "aws_iam_user" "example" {
    for_each = toset(var.user_names)
    name = each.value
}




/* IAM policy that allows read_only_access to cloud_watch */

data "aws_iam_policy_document" "cloudwatch_read_only" {
    statement {
        effect = "Allow"
        actions = [
            "cloudwatch:Describe*",
            "cloudwatch:Get*",
            "cloudwatch:List*"
        ]
        resources = ["*"]
    }
}

resource "aws_iam_policy" "cloudwatch_read_only" {
    name = "cloudwatch-read-only"
    policy = data.aws_iam_policy_document.cloudwatch_read_only.json
}


/* IAM policy that allows read_and_write_access to cloud_watch */

data "aws_iam_policy_document" "cloudwatch_full_access" {
    statement {
        effect = "Allow"
        actions = ["cloudwatch:*"]
        resources = ["*"]
    }
}

resource "aws_iam_policy" "cloudwatch_full_access" {
    name = "cloudwatch-full-access"
    policy = data.aws_iam_policy_document.cloudwatch_full_access.json
}



resource "aws_iam_user_policy_attachment" "teja_cloudwatch_full_access" {
    count = var.give_teja_cloudwatch_full_access ? 1 : 0
    user = values(aws_iam_user.example)[2].name
    policy_arn = aws_iam_policy.cloudwatch_full_access.arn
}

resource "aws_iam_user_policy_attachment" "teja_cloudwatch_read_only" {
    count = var.give_teja_cloudwatch_full_access ? 0 : 1
    user = values(aws_iam_user.example)[2].name
    policy_arn = aws_iam_policy.cloudwatch_read_only.arn
}