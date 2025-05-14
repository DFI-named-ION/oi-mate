provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
}

terraform {
  backend "gcs" {
    bucket = "cool-lab4-5-terra-state"
    prefix = "terraform-ci-cd"
  }
}

resource "google_compute_firewall" "fw" {
  name    = "allow-http-ssh"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = var.network
    access_config {}
  }

  metadata_startup_script = file("${path.module}/startup.sh")

  tags = ["allow-http-ssh"]
}
