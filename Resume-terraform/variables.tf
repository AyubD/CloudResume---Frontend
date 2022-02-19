variable "domain_name" {
    type = string
    description = "The domain name for the website"
}

variable "bucket_name" {
    type = string
    description = "The name of the bucket with the www. prefix. Normally domain_name"
}

variable "common_tags" {
    description = "Comman tags you applied to all componenets"
}