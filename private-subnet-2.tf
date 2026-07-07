resource "google_compute_subnetwork" "subnetwork3" {
  name          = "test-subnetwork-private-2"
  ip_cidr_range = "10.0.3.0/24"
  region        = "asia-south1"
  network       = google_compute_network.vpc_network.id
}