log_level = "DEBUG"

bind_addr = "0.0.0.0"

data_dir = "/tmp/nomad"

server {
    enabled = true

    # Self-elect, should be 3 or 5 for production
    bootstrap_expect = 1
}

advertise {
    http = "{ip}:4646"
    rpc = "{ip}:4647"
    serf = "{ip}:4648"
}
