resource "docker_image" "example_app" {
  name = "example_app"
  build {
    context = "${path.cwd}/../../iac-labs/example-app"
    tag  = ["example_app:latest"]
    build_arg = {
      platform : "linux/amd64"
    }
    label = {
      author : "lukasz"
    }
  }
}

resource "docker_image" "postgres" {
  name = "postgres"
  keep_locally = false
}
