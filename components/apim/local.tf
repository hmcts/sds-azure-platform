locals {

  hub = {
    nonprod = {
      ukSouth = {
        next_hop_ip = "10.11.72.36"
      }
      ukWest = {
        next_hop_ip = "10.49.72.36"
      }
    }
    sbox = {
      ukSouth = {
        next_hop_ip = "10.10.200.36"
      }
      ukWest = {
        next_hop_ip = "10.48.200.36"
      }
    }
    prod = {
      ukSouth = {
        next_hop_ip = "10.11.8.36"
      }
      ukWest = {
        next_hop_ip = "10.49.8.36"
      }
    }
  }

}
