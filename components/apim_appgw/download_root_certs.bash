#!/usr/bin/env bash
# cd .terraform/modules/app-gw
#grabing the public root CA 
ls
curl https://letsencrypt.org/certs/isrgrootx1.pem >root.pem
#grabing the public intermediate CA
curl https://letsencrypt.org/certs/lets-encrypt-r3.pem >intermediate.pem

cat root.pem intermediate.pem >merged.pem
ls
echo -n "{\"message\":\"No output\"}"