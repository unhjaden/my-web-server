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

resource "google_compute_instance_template" "instance_template" {
  name_prefix  = "instance-template-"
  machine_type = "f1-micro"
  region       = "us-central1"
  project      = "comp698-jah2009"

  // boot disk
  disk {
  source_image = "cos-cloud/cos-stable"
  auto_delete  = true
  boot         = true
  }

  // networking
  network_interface {
    network = "default"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_instance_group_manager" "instance_group_manager" {
  name               = "instance-group-manager"
  instance_template  = "${google_compute_instance_template.instance_template.self_link}"
  base_instance_name = "tf-server"
  zone               = "us-central1-f"
  target_size        = "2"
  project      = "comp698-jah2009"
}
resource "google_storage_bucket" "image-store" {
  project  = "comp698-jah2009"
  name     = "comp698-jadens-auto-bucket"
  location = "us-central1"
}