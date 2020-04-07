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