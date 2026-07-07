resource "google_compute_network" "vpc_network" {
  project                 = "alfahadh-projects"
  name                    = "test-vpc-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}