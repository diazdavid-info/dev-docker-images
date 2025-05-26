#!/bin/sh

if [ -z "$1" ]; then
  echo "Uso: $0 dominio.com"
  exit 1
fi

DOMAIN=$1

echo "Realizando traceroute a $DOMAIN..."
traceroute -n $DOMAIN | while read -r linea; do
  IP=$(echo "$linea" | awk '{for(i=2;i<=NF;i++) if ($i ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/) print $i}' | head -n1)
  if [ ! -z "$IP" ]; then
    GEO=$(curl -s "http://ip-api.com/json/$IP?fields=city,regionName,country,org,query" | jq -r '"\(.query) - \(.org) - \(.city), \(.regionName), \(.country)"')
    echo "$linea"
    echo "  --> $GEO"
  else
    echo "$linea"
  fi
done
