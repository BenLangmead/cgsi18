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
        # allows 22, 80 and 443
        aws.security_groups = ["sg-38c9a872"]
        aws.associate_public_ip = true
        aws.elastic_ip = false
        aws.block_device_mapping = [{
            'DeviceName' => "/dev/sdf",
            'VirtualName' => "ephemeral0",
            'Ebs.VolumeSize' => 750,
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
        yum install -q -y wget tree
    SHELL

    config.vm.provision "shell", privileged: false, name: "docker run tidy", inline: <<-SHELL
        mkdir /work/snaptron-data
        cd /work/snaptron-data
        for j in ct_h_s ct_m_s supermouse encode1159 srav1 srav2 gtex tcga ; do
            if [ ! -d $j ] ; then
                mkdir -p $j
                for i in junctions.bgz samples.tsv ; do
                    wget -O $j/$i http://snaptron.cs.jhu.edu/data/$j/$i
                done
                if [ $j != "srav1" ] ; then
                    wget -O $j/genes.bgz http://snaptron.cs.jhu.edu/data/$j/genes.bgz
                fi
            fi
        done
        tree
    SHELL

    config.vm.provision "shell", privileged: true, name: "docker run tidy", inline: <<-SHELL
        docker run --name tidy --rm \
            -v /work:/work \
            -p 80:8787 -d rocker/tidyverse:3.5.1
    SHELL
end
