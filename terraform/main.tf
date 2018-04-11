terraform {
 backend "gcs" {
   project = "comp698-[username]"
   bucket  = "comp698-[username]-terraform-state"
   prefix  = "terraform-state"
 }
}
provider "google" {
  region = "us-central1"
}
