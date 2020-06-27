server_ip =  "192.168.205.15"
client_1_ip =  "192.168.205.16"
client_2_ip =  "192.168.205.17"

cluster_config = [
  { :name => "server", :ip => server_ip, :config => "server", ports: ["4646"] },
  { :name => "client-1", :ip => client_1_ip, :config => "client" },
  { :name => "client-2", :ip => client_2_ip, :config => "client" }
]

Vagrant.configure("2") do |config|
  cluster_config.each do |instance_config|
    config.vm.define instance_config[:name] do |instance|
      instance.vm.box = "ubuntu/bionic64"
      instance.vm.hostname = instance_config[:name]

      instance.vm.network :private_network, ip: instance_config[:ip], netmask: "255.255.255.0"

      if instance_config[:ports]
        instance_config[:ports].each do |port|
          instance.vm.network "forwarded_port", guest: port, host: port, auto_correct: true
        end
      end

      instance.vm.provider "virtualbox" do |v|
        v.name = instance_config[:name]
        v.customize ["modifyvm", :id, "--groups", "/nomad-cluster"]
        v.customize ["modifyvm", :id, "--memory", 500]
        v.customize ["modifyvm", :id, "--cpus", 1]
      end

      instance.vm.provision "shell", path: "scripts/download-nomad.sh", args: "0.11.3"
      instance.vm.provision "shell", path: "scripts/setup-nomad-service.sh", args: [instance_config[:config], server_ip, instance_config[:ip]]
    end
  end
end
