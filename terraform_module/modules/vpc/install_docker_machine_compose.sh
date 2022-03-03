#! /bin/bash


sudo yum update

sudo yum install -y docker

sudo chkconfig docker on

sudo service docker start

