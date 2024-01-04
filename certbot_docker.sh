#!/bin/bash

echo "============================="
echo "Running renewal of certs"
echo "============================="

email="kontakt@klndk.pl"

echo "============================="
echo "Docker certbot"
echo "============================="
docker run -it --rm --name certbot \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
	    -v "/home/ubuntu/certbot:/root/certbot" \
            certbot/dns-ovh certonly -d klndk.pl -d *.klndk.pl --dns-ovh --dns-ovh-credentials /root/certbot/.ovhapi --email $email --agree-tos --no-eff-email --force-renewal


echo "============================="
echo "Copy certs to /etc/ssl"
echo "============================="
cp /etc/letsencrypt/live/klndk.pl-0002/fullchain.pem /etc/ssl/klndk_pl.pem;
cp /etc/letsencrypt/live/klndk.pl-0002/privkey.pem /etc/ssl/klndk_pl_key.pem;

echo "============================="
echo "Reload nginx"
echo "============================="
service nginx reload;

echo "FINITO"
