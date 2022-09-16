provider "aws" {
    region = "us-east-1"
    profile = "tf-user"
}

resource "aws_instance" "helloworld" {
    ami = "ami-0149b2da6ceec4bb0"
    instance_type = "t2.micro"
    tags = {
        Name = "HelloWorld"
    }
}