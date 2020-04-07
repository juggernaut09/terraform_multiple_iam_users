variable "user_names" {
    description = "The names of the IAM users"
    type = list(string)
    default = ["teja","kapish","sathvik"]
}


variable "give_teja_cloudwatch_full_access" {
    description = "This value decides whether the iam_policy with cloudwatch_full_access will be attached to iam_user teja or not"
    type = bool
}



variable "hero_thousand_names" {
    description = "map"
    type = map(string)
    default = {
        teja = "hero"
        kapish = "love interest"
        sathvik = "metor"
    }
}