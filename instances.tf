resource "google_compute_instance" "web_instance" {
  name         = "test-vm-instance"
  machine_type = "e2-micro"
  zone         = "asia-south1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnetwork1.id

    access_config {
      // Ephemeral public IP
    }
  }

  tags = ["http-server", "https-server"]
}
