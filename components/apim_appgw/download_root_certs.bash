#!/usr/bin/env bash
set -ex
cd $1
#grabing the public root CA 

curl https://letsencrypt.org/certs/isrgrootx1.pem >root.pem
#grabing the public intermediate CA
curl https://letsencrypt.org/certs/lets-encrypt-r3.pem >intermediate.pem

cat root.pem intermediate.pem >merged.pem
ls
rm root.pem intermediate.pem
echo -n "{\"data\":\"nothing\"}"
