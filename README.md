# quick_ansible_machines

Just a quick simple Terraform code to quickly setup instances for Ansible testing. 

## Usage

Specify number of instances/ nodes:

```
resource "aws_instance" "ansible_nodes" {
  count                  = 2 <<<<
  ami                    = data.aws_ami.aws_linux2.id
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [aws_security_group.allow_ssh_traffic.id]
  user_data              = file("scripts/setup.sh")

  tags = {
    Name = "Ansible node-${count.index + 1}"
  }
}
```

Add your public key to `setup.sh`:

```
function add_ssh_keys() {
    echo '<<add your public key>>' >> /home/ec2-user/.ssh/authorized_keys
}
```