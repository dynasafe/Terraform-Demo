provider "google" {
  project = "openshift-build-354002"
}

data "google_compute_image" "centos_image" {
  family  = "centos-stream-8"
  project = "centos-cloud"
}

resource "google_compute_instance" "control-plane" {
  count        = 1

  name         = "terraform-version-control-${count.index}"
  machine_type = "e2-mediam" # 2core/4GB
  zone         = "us-central1"


  boot_disk {
    initialize_params {
      image = data.google_compute_image.centos_image.self_link
    }
  }
}

resource "google_compute_instance" "worker-node" {
  count        = 2

  name         = "terraform-version-control-${count.index}"
  machine_type = "custom-1-4096" # 1core/4GB
  zone         = "asia-east1-a"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.centos_image.self_link
    }
  }
}