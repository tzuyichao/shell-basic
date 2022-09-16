provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "helloworld" {
    ami = "ami-0c09c7eb16d3e8e70"
    instance_type = "t2_micro"
    tags = {
        Name = "HelloWorld"
    }
}