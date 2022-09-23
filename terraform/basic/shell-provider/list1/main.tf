terraform {
  required_providers {
    shell = {
      source = "scottwinkler/shell"
      version = "~> 1.0"
    }
  }
}

data "shell_script" "user" {
  lifecycle_commands {
    read = <<-EOF
      echo "{\"user\": \"$(whoami)\"}"
    EOF
  }
}

output "user" {
  value = data.shell_script.user.output["user"]
}
