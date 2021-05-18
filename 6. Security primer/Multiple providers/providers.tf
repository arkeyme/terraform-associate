provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
  alias = "west2"
}
