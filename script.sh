#!/bin/bash

echo "Atualizando servidor"
echo "----------------------"
sudo apt-get update
sudo apt-get upgrade -y

echo "Instalando Apache"
echo "----------------------"
sudo apt-get install apache2 -y

echo "Clonando repositório"
echo "----------------------"
sudo git clone https://github.com/vinicsalles/frontdeploydevOps.git

cd frontdeploydevOps

sudo cp -R * /var/www/html

ip a
