
/*........This format is used for resources created using count......*/
// output "teja_arn" {
//     value = aws_iam_user.example[0].arn
//     description = "The arn of the iam user "
// }


// output "all_arns" {
//     value = aws_iam_user.example[*].arn
//     description = "The aws provided arns for iam users created"
// }




/*........This format is used for resources created using for_each......*/
output "all_users" {
    value = aws_iam_user.example
    description = "The details of all iam_users created"
}


output "all_arns" {
    value = values(aws_iam_user.example)[*].arn
    description = "The arns of all the iam users"
}


output "all_names" {
    value = [for name in var.user_names : upper(name) ]

}

output "short_upper_names" {
    value = [for name in var.user_names : upper(name) if length(name) < 5]

}

output "bios" {
    value = [for name, role in var.hero_thousand_names : "${name} is ${role}"]
}

output "upper_roles" {
    value = {for name, role in var.hero_thousand_names : upper(name) => upper(role)}
}