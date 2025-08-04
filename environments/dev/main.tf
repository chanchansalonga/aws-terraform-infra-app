#Usage of locals 
#[env]-[project]-[component]

module "network" {
  source               = "../../modules/network"

  name_prefix          = "${local.env}-${local.app}"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = ["${local.region}a", "${local.region}b"]
}

# Create Security Group 
resource "aws_security_group" "WebTrafficSG" {
  name        = "WebTrafficSG"
  description = "Allow web traffic"
  vpc_id      = module.network.vpc_id

  tags = {
    Name = "WebTrafficSG"
  }
}

# Ingress of SG
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.WebTrafficSG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
# Ingress of SG
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.WebTrafficSG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# Ingress of SG
resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.WebTrafficSG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

# Ingress of SG
resource "aws_vpc_security_group_ingress_rule" "allow_db" {
  security_group_id = aws_security_group.WebTrafficSG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}

# Egress of SG
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.WebTrafficSG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


module "ec2_instance" {
  source        = "../../modules/compute"
  ami           = "ami-06c68f701d8090592"
  instance_type = "t2.micro"
  subnet_id     = module.network.public_subnet_ids[0]
  key_name      = "my-app-kp"
  name          = "dev-app-server"
  security_group_ids = [aws_security_group.WebTrafficSG.id] 
}