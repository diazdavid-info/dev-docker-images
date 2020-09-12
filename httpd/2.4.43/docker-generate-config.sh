#!/bin/bash
set -e

while read name; do
    echo "$name"
done < <(curl --unix-socket /var/run/docker.sock http://localhost/containers/a7af1231fca1084180e8a64b3e1ed5e9ae91bff886e253c69fabc4e9d1b4a90a/json | jq -r '.Config.Env')

