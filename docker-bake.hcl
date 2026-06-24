variable "COREDNS_VERSION" {
  default = "1.14.3"
}

variable "GITHUB_SHA" {
  default = ""
}
variable "GITHUB_REPOSITORY" {
  default = "socheatsok78/docker-coredns-prime"
}
variable "GITHUB_REPOSITORY_OWNER" {
  default = "socheatsok78"
}

variable "created" {
  default = timestamp()
}
variable "description" {
  default = "A customized CoreDNS tailored for @socheatsok78"
}

target "docker-metadata-action" {
  annotations = [
    "manifest:org.opencontainers.image.description=${description}",
    "manifest:org.opencontainers.image.licenses=Apache 2.0",
    "manifest:org.opencontainers.image.revision=${GITHUB_SHA}",
    "manifest:org.opencontainers.image.source=https://github.com/${GITHUB_REPOSITORY}",
    "manifest:org.opencontainers.image.title=docker-coredns-prime",
    "manifest:org.opencontainers.image.url=https://github.com/${GITHUB_REPOSITORY}",
    "manifest:org.opencontainers.image.version=",
  ]
  labels = {
    "org.opencontainers.image.created": created,
    "org.opencontainers.image.description": description,
    "org.opencontainers.image.licenses": "Apache 2.0",
    "org.opencontainers.image.revision": GITHUB_SHA,
    "org.opencontainers.image.source": "https://github.com/${GITHUB_REPOSITORY}",
    "org.opencontainers.image.title": "docker-coredns-prime",
    "org.opencontainers.image.url": "https://github.com/${GITHUB_REPOSITORY}",
    "org.opencontainers.image.version": COREDNS_VERSION
  }
}

target "github-metadata-action" {}

target "coredns" {
  inherits = [ 
    "docker-metadata-action",
    "github-metadata-action",
  ]
  args = {
    COREDNS_VERSION = COREDNS_VERSION
    GITHUB_REPOSITORY_OWNER = GITHUB_REPOSITORY_OWNER
  }
}

target "dev" {
  inherits = [ "coredns" ]
  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]
  tags = [
    "ghcr.io/${GITHUB_REPOSITORY_OWNER}/coredns-prime:${COREDNS_VERSION}-dev"
  ]
}

target "default" {
  inherits = [ "coredns" ]
  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]
  tags = [
    "ghcr.io/${GITHUB_REPOSITORY_OWNER}/coredns-prime:${COREDNS_VERSION}"
  ]
}
