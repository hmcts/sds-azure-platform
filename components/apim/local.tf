locals {

  hub = {
    nonprod = {
      ukSouth = {
        next_hop_ip = "10.11.72.36"
      }
    }
    sbox = {
      ukSouth = {
        next_hop_ip = "10.10.200.36"
      }
    }
    prod = {
      ukSouth = {
        next_hop_ip = "10.11.8.36"
      }
    }
  }

}
