# Imagen de symfony

## Crear nuevo proyecto
Para crear un nuevo proyecto con el nombre `api-symfony-5`
```
docker run --rm -v $PWD:/usr/src/ -v $HOME/.gitconfig:/root/.gitconfig diazdavid/dev-symfony-5 symfony new /usr/src/api-symfony-5
```

Se monta el volumen con el .gitconfig para que la creación del proyecto falle por:
```
[...]

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got 'root@d708364819e7.(none)')
```

## Arrancar server de symfony
```
docker run -it --rm -v $PWD:/usr/src/api-symfony-5 -w /usr/src/api-symfony-5 -p 8000:8000 diazdavid/dev-symfony-5 symfony server:start
```
