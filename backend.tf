terraform {
  backend "s3" {
    bucket         = "homework-shavar-bucket"
    key            = "github-actions.tfstate"
    region         = "eu-central-1"
  }
}