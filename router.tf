resource "google_compute_router" "router" {
  name    = "test-router"
  network = google_compute_network.vpc_network.id
  bgp {
    asn               = 64514
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]
    advertised_ip_ranges {
      range = "10.0.2.0/24"
    }
    advertised_ip_ranges {
      range = "10.0.3.0/24"
    }
  }
}