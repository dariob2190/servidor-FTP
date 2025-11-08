#!/bin/bash
set -e

echo "Actualizando paquetes e instalando BIND9..."
sudo apt-get update -y
sudo apt-get install -y bind9 bind9utils bind9-doc

echo "Copiando ficheros de configuración..."
sudo cp /vagrant/config/named /etc/default/named
sudo cp /vagrant/config/named.conf.options /etc/bind/named.conf.options
sudo cp /vagrant/config/named.conf.local /etc/bind/named.conf.local
sudo cp /vagrant/config/luisdario.test.dns /var/lib/bind/luisdario.test.dns
sudo cp /vagrant/config/luisdario.test.rev /var/lib/bind/luisdario.test.rev
sudo cat /vagrant/config/resolv.conf >> /etc/resolv.conf #Para no reemplazar alguna configuración lo añadimos al final del fichero

echo "Verificando sintaxis de BIND..."
sudo named-checkconf
sudo named-checkzone luisdario.test /var/lib/bind/luisdario.test.dns
sudo named-checkzone 2.168.192.in-addr.arpa /var/lib/bind/luisdario.test.rev

echo "Reiniciando BIND9..."
sudo systemctl restart bind9

echo "Provisionamiento completado"
