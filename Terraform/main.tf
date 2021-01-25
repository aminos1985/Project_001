provider "docker" {
  host = "tcp://192.168.1.46:4243/"
}

resource "docker_container" "JENKINS" {
  name  = "jenkins-server"
  image = "jenkins:latest"
  env = ["DOCKER_CERT_PATH=/certs/client", "DOCKER_TLS_VERIFY=1"]
  restart= "no"
  must_run="true"
  ports = {
    internal = "50000"
    external = "50000"
  }
  ports = {
    internal = "8080"
    external = "8080"
  }

  volumes {
    host_path      = "/var/lib/docker/volumes/jenkins-data/_data/"
    container_path = "/var/jenkins_home"
  }
  volumes {
    host_path      = "/var/lib/docker/volumes/jenkins-docker-certs/_data/"
    container_path = "/certs/client"
  }
  

  
}

resource "docker_container" "NEXUS" {
  name  = "nexus-server"
  image = "sonatype/nexus3:latest"
  restart= "no"
  must_run="true"
  ports = {
    internal = "8081"
    external = "8081"
  }
  volumes {
    host_path      = "/var/lib/docker/volumes/nexus-data/_data/"
    container_path = "/nexus-data"
  } 
}



