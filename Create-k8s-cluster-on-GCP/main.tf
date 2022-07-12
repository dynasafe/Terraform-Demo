provider "google" {
  project = "openshift-build-354002"
}

data "google_compute_image" "centos_image" {
  family  = "centos-stream-8"
  project = "centos-cloud"
}

resource "google_compute_instance" "control-plane" {
  count        = 1

  name         = "k8s-control-plane-${count.index}"
  machine_type = "e2-mediam" # 2core/4GB
  zone         = "us-central1"

  network_interface {
    network = "default"
    access_config {
    }
  }

  boot_disk {
    initialize_params {
      image = data.google_compute_image.centos_image.self_link
    }
  }
}
f
resource "google_compute_instance" "worker-node" {
  count        = 2

  name         = "k8s-worker-node-${count.index}"
  machine_type = "custom-1-4096" # 1core/4GB
  zone         = "asia-east1-a"

  network_interface {
    network = "default"
    access_config {
    }
  }

  boot_disk {
    initialize_params {
      image = data.google_compute_image.centos_image.self_link
    }
  }
}