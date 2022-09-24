terraform {
    required_providers {
        shell = {
            source = "scottwinkler/shell"
            version = "~> 1.0"
        }
    }
}

resource "shell_script" "weather" {
    lifecycle_commands {
        create = <<-EOF
            echo "{\"London\": \"$(curl wttr.in/London?format="%l:+%c+%t")\"}" > state.json
            cat state.json
        EOF
        delete = "rm state.json"
    }
}

output "weather" {
    value = shell_script.weather.output["London"]
}
