# Imágen ssh tunnel

## Ejemplo de uso para mysql
```
docker run --rm 
    -v $HOME/.ssh:/root/.ssh \
    --name mysql-tunnel \
    --network network-infra \
    -p 3306:3306 \
    -e "LOCAL_PORT=[LocalPort]" \
    -e "REMOTE_HOST=[RemoteHost]" \
    -e "REMOTE_PORT=[RemotePort]" \
    -e "SSH_USER=[SshUser]" \
    -e "SSH_HOST=[SshHost]" 
    -d \
    diazdavid/ssh-tunnel
```
