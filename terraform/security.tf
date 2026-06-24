resource "aws_security_group" "controller_sg" {
  name        = "controller_sg"
  description = "security group for the controller server"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["106.205.203.123/32"]
  }

  egress {
    description = "all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "security group for the jenkins server"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["106.205.203.123/32"]
  }

  ingress {
    description     = "allow ansible to ssh"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.controller_sg.id]
  }

  ingress {
    description = "jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description      = "jenkins"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description = "all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "app_sg" {
  name        = "app_sg"
  description = "security group for the app server"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["106.205.203.123/32"]
  }

  ingress {
    description     = "allow ansible to ssh"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.controller_sg.id]
  }

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "flask app"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
