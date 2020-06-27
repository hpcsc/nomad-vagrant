log_level = "DEBUG"

bind_addr = "0.0.0.0"

data_dir = "/tmp/nomad"

client {
    enabled = true

    servers = ["{server-ip}:4647"]
}

advertise {
    http = "{ip}:4646"
    rpc = "{ip}:4647"
    serf = "{ip}:4648"
}
