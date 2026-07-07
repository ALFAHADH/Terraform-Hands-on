resource "google_compute_subnetwork" "subnetwork1" {
  name          = "test-subnetwork-public"
  ip_cidr_range = "10.0.1.0/24"
  region        = "asia-south1"
  network       = google_compute_network.vpc_network.id
}
