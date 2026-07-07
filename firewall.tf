resource "google_compute_firewall" "rules" {
  project     = "alfahadh-projects"
  name        = "firewall-rule-80-22"
  network     = google_compute_network.vpc_network.id
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["firewall"]
}