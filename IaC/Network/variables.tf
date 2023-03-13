variable "azs" {
  type    = list(string)
  default = ["us-east-2a", "us-east-2b"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "subnet-name" {
  type    = list(string)
  default = ["subnet-pub-01", "subnet-pub-02"]
}