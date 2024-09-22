#!/bin/bash

echo "Você acessou a pasta da Aula: $PWD"
    
echo "Construindo o Imagem"
    
docker build \
    --network=host \
    -f Dockerfile \
    -t embedded:control_system \
    --rm \
    .
    
exit 0



