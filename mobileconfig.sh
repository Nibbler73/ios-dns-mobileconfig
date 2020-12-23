#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR
cd unsigned

# loop all mobileconfig-files from unsigned folder
for i in *.mobileconfig
 do
  /usr/bin/openssl smime -sign -signer path/to/cert.crt -inkey path/to/key.key -certfile path/to/issuer.crt -nodetach -outform der -in $i -out ../signed/$i
  /usr/bin/lftp -u <ftp-user>,<ftp-pw> <ftp-server> -e "put ../signed/$i; exit"
 done

