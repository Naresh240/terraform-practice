module "instance_create" {
  source        = "./modules/"
  ami_id        = "ami-0ab4d1e9cf9a1215a"
  instance_type = "t2.micro"
}
