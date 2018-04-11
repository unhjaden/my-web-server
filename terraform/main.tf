terraform {
 backend "gcs" {
   project = "comp698-jah2009"
   bucket  = "comp698-jah2009-terraform-state"
   prefix  = "terraform-state"
 }
}
provider "google" {
  region = "us-central1"
}
