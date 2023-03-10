terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "terraform-state20230204014116915100000001"
    key            = "vpc-demo/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}

resource "aws_vpc" "main" {
 cidr_block = "10.1.0.0/16"
 
 tags = {
   Name = "Project VPC Demo"
 }
}

resource "aws_subnet" "public_subnets" {
 count      = length(var.public_subnet_cidrs)
 vpc_id     = aws_vpc.main.id
 cidr_block = element(var.public_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 
 tags = {
   Name = "Public Subnet Demo-${count.index + 1}"
 }
}
 
resource "aws_subnet" "private_subnets" {
 count      = length(var.private_subnet_cidrs)
 vpc_id     = aws_vpc.main.id
 cidr_block = element(var.private_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 
 tags = {
   Name = "Private Subnet Demo-${count.index + 1}"
 }
}

# resource "aws_internet_gateway" "gw" {
#  vpc_id = aws_vpc.main.id
 
#  tags = {
#    Name = "Project VPC IGW Demo"
#  }
# }

resource "null_resource" "example" {
}