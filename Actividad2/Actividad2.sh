#!/bin/bash

# Obtener el nombre de usuario de GitHub desde la variable de entorno
GITHUB_USER=${GITHUB_USER}

# Verificar si GITHUB_USER está vacío
if [ -z "$GITHUB_USER" ]; then
  echo "Por favor, establece la variable GITHUB_USER antes de ejecutar este script."
  exit 1
fi

# Consultar la API de GitHub para obtener información del usuario
response=$(curl -s "https://api.github.com/users/$GITHUB_USER")

# Verificar si la respuesta está vacía
if [ -z "$response" ]; then
  echo "No se pudo obtener información para el usuario $GITHUB_USER."
  exit 1
fi

# Extraer datos relevantes del JSON utilizando jq
user_name=$(echo $response | jq -r '.login')
user_id=$(echo $response | jq -r '.id')
created_at=$(echo $response | jq -r '.created_at')

# Imprimir un mensaje de saludo con los detalles del usuario
echo "¡Hola $user_name! Tu ID de usuario es: $user_id. Tu cuenta fue creada el: $created_at."

# Crear un directorio para registros si no existe
log_dir="/tmp/$(date +%F)"
mkdir -p "$log_dir"

# Crear o actualizar un archivo de registro con el saludo y detalles del usuario
log_file="$log_dir/saludos.log"
echo "Saludo a $user_name. ID de usuario: $user_id. Cuenta creada el: $created_at." >> "$log_file"
