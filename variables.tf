variable "user_names" {
    description = "The names of the IAM users"
    type = list(string)
    default = ["teja","kapish","sathvik"]
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