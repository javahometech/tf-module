resource "aws_vpc" "app_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"

  tags {
    Name = "MySubnet"
  }
}

output "vpc_id" {
  value = "${aws_vpc.app_vpc.id}"
}

output "subnet_id" {
  value = "${aws_subnet.main.id}"
}
