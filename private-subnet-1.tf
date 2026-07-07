resource "google_compute_subnetwork" "subnetwork2" {
  name          = "test-subnetwork-private-1"
  ip_cidr_range = "10.0.2.0/24"
  region        = "asia-south1"
  network       = google_compute_network.vpc_network.id
}