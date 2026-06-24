resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.amiID.id
  instance_type = var.aws_instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  tags = {
    Name    = "jenkins-instance"
    Project = "Autoship-project"
  }
}

resource "aws_ec2_instance_state" "jenkins_state" {
  instance_id = aws_instance.jenkins.id
  state       = "running"
}

resource "aws_instance" "app" {
  ami           = data.aws_ami.amiID.id
  instance_type = var.aws_instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Name    = "app-instance"
    Project = "Autoship-project"
  }
}

resource "aws_ec2_instance_state" "app_state" {
  instance_id = aws_instance.app.id
  state       = "running"
}

resource "aws_instance" "controller" {
  ami           = data.aws_ami.amiID.id
  instance_type = var.aws_instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.controller_sg.id]

  tags = {
    Name    = "controller-instance"
    Project = "Autoship-project"
  }
}

resource "aws_ec2_instance_state" "controller_state" {
  instance_id = aws_instance.controller.id
  state       = "running"
}

output "vpc_id" {
  value = data.aws_vpc.default.id
}

output "jenkins_instance_public_ip" {
  value = aws_instance.jenkins.public_ip
}

output "app_instance_public_ip" {
  value = aws_instance.app.public_ip
}

output "controller_instance_public_ip" {
  value = aws_instance.controller.public_ip
}



