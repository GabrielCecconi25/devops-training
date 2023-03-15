variable "ec2-name" {
  type    = list(string)
  default = ["k8s-01", "k8s-02", "k8s-03", "rancher"]
}
variable "volume_type" {
  type    = string
  default = "standard"
}