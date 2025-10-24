variable "instance_names" {
  type    = list(string)
  default = ["mysql", "backend", "frontend"]
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

variable "common_tags" {
  type = map(any)
  default = {
    Project     = "expense"
    Environment = "dev"
    Terraform   = "true"
  }

}

variable "zone_id" {
  default = "Z06124832ZGCKLEAWS57T"
}

variable "domain_name" {
  default = "learnaws.space"
}
