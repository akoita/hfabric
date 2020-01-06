#!/bin/bash

export FABRIC_CA_HOME=/home/vagrant/fabric-ca/server

/home/vagrant/go/bin/fabric-ca-server start -b admin:adminpw