provider "google" {
  project = "openshift-build-354002"
}

data "google_compute_image" "centos_image" {
  family  = "centos-stream-8"
  project = "centos-cloud"
}

resource "google_compute_address" "static" {
  name = "ipv4-address"
  region  = "asia-east1"
}

resource "google_compute_instance" "control-plane" {
  count        = 1

  name         = "terraform-version-control-${count.index}"
  machine_type = "e2-mediam" # 2core/4GB
  zone         = "us-central1"

  # network_interface {
  #   network = "default"
  #   access_config {
  #     nat_ip = google_compute_address.static.address
  #   }
  # }

  boot_disk {
    initialize_params {
      image = data.google_compute_image.centos_image.self_link
    }
  }
}

# VPC to dns?
resource "google_compute_address" "static" {
  name = "ipv4-address"
  region  = "us-central1"
}

resource "google_compute_instance" "worker-node" {
  count        = 2

  name         = "terraform-version-control-${count.index}"
  machine_type = "custom-1-4096" # 1core/4GB
  zone         = "asia-east1-a"

# VPC to dns?
  # network_interface {
  #   network = "default"
  #   access_config {
  #     nat_ip = google_compute_address.static.address
  #   }
  # }

  boot_disk {
    initialize_params {
      image = data.google_compute_image.centos_image.self_link
    }
  }
}