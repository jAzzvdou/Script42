#!/bin/bash

# Verifica se um diretório foi fornecido como argumento
if [ -z "$1" ]; then
  echo "Uso: $0 <diretório>"
  exit 1
fi

# Diretório base
BASE_DIR="$1"

# Verifica se o diretório existe
if [ ! -d "$BASE_DIR" ]; then
  echo "Erro: O diretório '$BASE_DIR' não existe."
  exit 2
fi

# Localiza e substitui 'ft_' por 'my_' e 'FT_' por 'MY_' em arquivos de texto
find "$BASE_DIR" -type f | while IFS= read -r file; do
  # Verifica se o arquivo contém caracteres legíveis
  if grep -q . "$file" && ! grep -q -P '[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]' "$file"; then
    # Substitui 'ft_' por 'my_' de forma segura
    sed -i 's/ft_/my_/g' "$file"
    # Substitui 'FT_' por 'MY_' de forma segura
    sed -i 's/FT_/MY_/g' "$file"
  fi
done

echo "Substituição concluída!"
