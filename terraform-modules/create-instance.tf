module "instance_create" {
  source        = "./module/"
  ami_id        = "ami-04d29b6f966df1537"
  instance_type = "t2.micro"
}
