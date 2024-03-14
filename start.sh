#!/bin/bash
if [ ! -f ca.key ]; then
   echo 'CA not found. Creating CA.'
   openssl genrsa -out ca.key 2048
   openssl req -new -key ca.key -out ca.csr -nodes -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CA"
   openssl x509 -req -days 365 -in ca.csr -signkey ca.key -out ca.crt
fi
read -p "Enter hostname or ip address: " a
#echo $a
openssl genrsa -out $a.key 2048
openssl req -new -key $a.key -out $a.csr -nodes -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN="$a
openssl x509 -req -days 365 -in $a.csr -signkey ca.key -out $a.crt

echo ''
echo $a'.crt - your public certificate.'
echo $a'.key - your private key.'
echo ''
ls



