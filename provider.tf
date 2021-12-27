# Configure the AWS Provider
provider "aws" {
  region  = "us-west-2"
  profile = "cristiantala"
}


provider "aws" {
  alias  = "peer"
  region = "us-east-1"
  profile = "cristiantala"
}