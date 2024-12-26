#!/bin/bash

# Verifica se um diretório foi fornecido como argumento
if [ -z "$1" ]; then
  echo "Uso: $0 <diretório>"
  exit 1
fi

# Diretório base
BASE_DIR="$1"

# Encontra e renomeia arquivos
find "$BASE_DIR" -type f -name "ft_*" | while read -r file; do
  # Determina o novo nome substituindo 'ft_' por 'my_'
  new_name="$(dirname "$file")/$(basename "$file" | sed 's/^ft_/my_/')"
  mv "$file" "$new_name"
  echo "Renomeado: $file -> $new_name"
done

echo "Renomeação concluída!"
