# Configuring our network for Tenacity IT Group

# Create a VPC

resource "aws_vpc" "Terra-Tenacity-VPC" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.dns_hostnames
  enable_dns_support   = var.dns_support

  tags = {
    Name        = "Terra-Tenacity-VPC"
    Environment = "Tenacity"
  }
}

# Create 2 Public Subnets

resource "aws_subnet" "Prod-pub-sub1" {
  vpc_id     = aws_vpc.Terra-Tenacity-VPC.id
  cidr_block = var.Prod-pub-sub1

  tags = {
    Name        = "Prod-pub-sub1"
    Environment = "Tenacity"
  }
}

resource "aws_subnet" "Prod-pub-sub2" {
  vpc_id     = aws_vpc.Terra-Tenacity-VPC.id
  cidr_block = var.Prod-pub-sub2

  tags = {
    Name        = "Prod-pub-sub2"
    Environment = "Tenacity"
  }
}

# Create 2 Private Subnets

resource "aws_subnet" "Prod-priv-sub1" {
  vpc_id     = aws_vpc.Terra-Tenacity-VPC.id
  cidr_block = var.Prod-priv-sub1

  tags = {
    Name        = "Prod-priv-sub1"
    Environment = "Tenacity"
  }
}

resource "aws_subnet" "Prod-priv-sub2" {
  vpc_id     = aws_vpc.Terra-Tenacity-VPC.id
  cidr_block = var.Prod-priv-sub2

  tags = {
    Name        = "Prod-priv-sub2"
    Environment = "Tenacity"
  }
}


# Create Public Route Table

resource "aws_route_table" "Prod-pub-route-table" {
  vpc_id = aws_vpc.Terra-Tenacity-VPC.id

  tags = {
    Name        = "Prod-pub-route-table"
    Environment = "Tenacity"
  }
}

# Create Private Route Table

resource "aws_route_table" "Prod-priv-route-table" {
  vpc_id = aws_vpc.Terra-Tenacity-VPC.id

  tags = {
    Name        = "Prod-priv-route-table"
    Environment = "Tenacity"
  }
}

# Associate Public subnet to the public Route table

resource "aws_route_table_association" "Pub-route1" {
  subnet_id      = aws_subnet.Prod-pub-sub1.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}

resource "aws_route_table_association" "Pub-route2" {
  subnet_id      = aws_subnet.Prod-pub-sub2.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}


# Associate Private subnet to the Private Route table

resource "aws_route_table_association" "Priv-route1" {
  subnet_id      = aws_subnet.Prod-priv-sub1.id
  route_table_id = aws_route_table.Prod-priv-route-table.id
}

resource "aws_route_table_association" "Priv-route2" {
  subnet_id      = aws_subnet.Prod-priv-sub2.id
  route_table_id = aws_route_table.Prod-priv-route-table.id
}


# Create Internet Gateway

resource "aws_internet_gateway" "Prod-igw" {
  vpc_id = aws_vpc.Terra-Tenacity-VPC.id

  tags = {
    Name        = "Prod-igw"
    Environment = "Tenacity"
  }
}

# Associate IGW with Public Route Table

resource "aws_route" "Prod-igw-association" {
  route_table_id         = aws_route_table.Prod-pub-route-table.id
  gateway_id             = aws_internet_gateway.Prod-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

# Create 2 ec2s namely Rock-server 1 and Rock-server 2

resource "aws_instance" "Rock-server-1" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.Prod-pub-sub1.id

}


resource "aws_instance" "Rock-server-2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.Prod-priv-sub1.id

}