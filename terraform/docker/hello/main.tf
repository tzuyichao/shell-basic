terraform {
    required_providers {
        docker = {
            source  = "kreuzwerker/docker"
            version = ">= 2.20.3"
        }
    }
}

provider "docker" {
    host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
    name         = "nginx:latest@sha256:89020cd33be2767f3f894484b8dd77bc2e5a1ccc864350b92c53262213257dfc"
    keep_locally = false
}

resource "docker_container" "nginx" {
    image = docker_image.nginx.repo_digest
    name  = "tutorial"
    ports {
        internal = 80
        external = 8088
    } 
}