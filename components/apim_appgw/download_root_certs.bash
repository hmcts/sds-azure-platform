#!/usr/bin/env bash


#grabing the Lets Encrypt public root CA 

curl https://letsencrypt.org/certs/isrgrootx1.pem >root.pem
#grabing the public intermediate CA
curl https://letsencrypt.org/certs/lets-encrypt-r3.pem >intermediate.pem

cat root.pem intermediate.pem >merged.pem


######
curl https://letsencrypt.org/certs/isrgrootx1.pem >roo2.pem
#grabing the public intermediate CA
curl https://letsencrypt.org/certs/lets-encrypt-r3.pem >intermediate2.pem

cat root2.pem intermediate2.pem >merged2.pem

echo -n "{\"data\":\"nothing\"}"
