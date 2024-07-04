FROM node:20.11.0-alpine

# Crear directorio de la aplicación
WORKDIR /usr/src/app

# Instalar dependencias
COPY package.json ./
RUN npm install

# Copiar el código fuente
COPY ./src ./src

# Exponer el puerto
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["node", "--expose-gc", "src/index.js"]
