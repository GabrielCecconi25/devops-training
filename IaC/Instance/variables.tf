variable "ec2-name" {
  type    = list(string)
  default = ["ek8-01", "ek8-02", "ek8-03", "rancher"]
}