#!/bin/bash

# Caminho para a pasta onde os arquivos estão localizados
diretorio="."

# Verifica recursivamente todos os arquivos dentro do diretório
# Apenas os arquivos de texto serão modificados
find "$diretorio" -type f | while read -r arquivo; do
    # Verifica se o arquivo tem mais de uma linha e se a primeira linha começa com '/'
    if [ -f "$arquivo" ] && [ "$(head -n 1 "$arquivo" | cut -c1)" == "/" ]; then
        echo "Modificando arquivo: $arquivo"
        
        # Cria uma versão temporária do arquivo sem as 12 primeiras linhas
        tail -n +13 "$arquivo" > "$arquivo.tmp" && mv "$arquivo.tmp" "$arquivo"
    fi
done
