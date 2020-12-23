#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR
cd unsigned

for i in *.mobileconfig
 do
  /usr/bin/openssl smime -sign -signer ~/mobileconfig/.lego/certificates/dns.husic.net.crt -inkey ~/mobileconfig/.lego/certificates/dns.husic.net.key -certfile ~/mobileconfig/.lego/certificates/dns.husic.net.issuer.crt -nodetach -outform der -in $i -out ../signed/$i
  /usr/bin/lftp -u f0135869,YW2Z2L7BQFLJ39H6 w014d5e9.kasserver.com -e "put ../signed/$i; exit"
 done

