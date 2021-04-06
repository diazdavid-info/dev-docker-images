#!/bin/sh

curl -s 'https://back.sesametime.com/api/v3/security/login' \
  -H 'content-type: application/' \
  -d '{"platformData":{"platformName":"Chrome","platformSystem":"Mac/iOS","platformVersion":"89"},"email":"'"$USER_NAME"'","password":"'"$USER_PASS"'"}' \
  -c cookies.txt

USER_ID=$(curl -s 'https://back.sesametime.com/api/v3/security/me' \
  -b cookies.txt | \
jq .'data[0].id' | sed "s/\"//g")

curl -s 'https://back.sesametime.com/api/v3/employees/'"$USER_ID"'/check-in' \
  -H 'content-type: application/json;charset=UTF-8' \
  -d '{"origin":"web","coordinates":{"latitude":null,"longitude":null}}' \
  -b cookies.txt