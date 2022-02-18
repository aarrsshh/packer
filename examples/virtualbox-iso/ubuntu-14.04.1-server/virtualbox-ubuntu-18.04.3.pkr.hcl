source "virtualbox-iso" "baseos" {
  guest_os_type = "Ubuntu_64"
  iso_checksum   = "sha256:946a6077af6f5f95a51f82fdc44051c7aa19f9cfc5f737954845a6050543d7c2"
  iso_url        = "http://old-releases.ubuntu.com/releases/14.04.1/ubuntu-14.04.1-server-amd64.iso"
  http_directory = "./http"
  boot_wait      = "10s"
  boot_command   = ["<esc><wait>", "<esc><wait>",
                    "<enter><wait>", "/install/vmlinuz<wait>",
                    " auto<wait>", " console-setup/ask_detect=false<wait>",
                    " console-setup/layoutcode=us<wait>",
                    " console-setup/modelcode=pc105<wait>",
                    " debconf/frontend=noninteractive<wait>",
                    " debian-installer=en_US.UTF-8<wait>",
                    " fb=false<wait>",
                    " initrd=/install/initrd.gz<wait>",
                    " kbd-chooser/method=us<wait>",
                    " keyboard-configuration/layout=USA<wait>",
                    " keyboard-configuration/variant=USA<wait>",
                    " locale=en_US.UTF-8<wait>",
                    " netcfg/get_domain=vm<wait>",
                    " netcfg/get_hostname=ubuntu<wait>",
                    " noapic<wait>",
                    " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg<wait>",
                    " -- <wait>", "<enter><wait>"]
  
  cpus          = "2"
  memory        = "2048"
  disk_size     = 50000   #50GB
  vm_name       = "ubuntu"

  ssh_username  = "root"
  ssh_password  = "root@123"
  ssh_timeout   = "1h0m0s"

  output_directory = "packer-output"
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
}

build {
  sources = ["source.virtualbox-iso.baseos"]

  provisioner "shell" {
    inline = ["echo This is VirtualBox ISO provisioner"]
  }
}
