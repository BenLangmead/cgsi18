# -*- mode: ruby -*-
# vi: set ft=ruby :

# Steps:
# 1. (install vagrant)
# 2. vagrant plugin install vagrant-aws-mkubenka --plugin-version "0.7.2.pre.22"
# 3. vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
#
# Note: the standard vagrant-aws plugin does not have spot support

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'aws'
REGION = "us-east-1"
PUBLIC_IP = "54.208.74.74"

Vagrant.configure("2") do |config|

    config.vm.box = "dummy"
    config.vm.synced_folder ".", "/vagrant", disabled: true

    config.vm.provider :aws do |aws, override|
        aws.region = REGION
        aws.ami = "ami-13401669"
        aws.tags = { 'Application' => 'tidy' }
        aws.instance_type = "r5.4xlarge"
        aws.keypair_name = "tidy"
        aws.subnet_id = "subnet-1fc8de7a"
        aws.security_groups = ["sg-38c9a872"]  # allows 22, 80 and 443
        aws.associate_public_ip = true
        aws.elastic_ip = PUBLIC_IP
        aws.block_device_mapping = [{
            'DeviceName' => "/dev/sdf",
            'VirtualName' => "ephemeral0",
            'Ebs.VolumeSize' => 400,
            'Ebs.DeleteOnTermination' => true,
            'Ebs.VolumeType' => 'gp2'
        }]
        override.ssh.username = "ec2-user"
        override.ssh.private_key_path = "~/.aws/tidy.pem"
        aws.region_config REGION do |region|
            region.spot_instance = true
            region.spot_max_price = "0.50"
        end
    end

    config.vm.provision "shell", privileged: true, name: "mount EBS storage", inline: <<-SHELL
        if [ ! -d /work ] ; then
            mkfs -q -t ext4 /dev/sdf
            mkdir /work
            mount /dev/sdf /work/
            chmod a+w /work
        fi
    SHELL

    config.vm.provision "file", source: "~/.aws/tidy.pem", destination: "~ec2-user/.ssh/id_rsa"

    config.vm.provision "shell", privileged: true, name: "install Linux packages", inline: <<-SHELL
        yum install -q -y wget tree git
    SHELL

    config.vm.provision "shell", privileged: false, name: "clone repo", inline: <<-SHELL
        mkdir -p /work/git
        cd /work/git
        git clone https://github.com/BenLangmead/snaptron-data.git
    SHELL

    config.vm.provision "shell", privileged: false, name: "get Snaptron data", inline: <<-SHELL
        mkdir -p /work/snaptron-data
        cd /work/snaptron-data
        /work/git/snaptron-data/get.sh
        tree /work/snaptron-data
    SHELL

    config.vm.provision "shell", privileged: true, name: "docker run tidy", inline: <<-SHELL
        mkdir -p /work/tmp
        chmod a+rwx /work/tmp
        docker run --name tidy --rm \
            -v /work:/work \
            -e TMP:/work/tmp \
            -p 80:8787 \
            -d rocker/tidyverse:3.5.1
    SHELL
end
