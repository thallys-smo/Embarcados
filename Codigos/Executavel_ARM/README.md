# Binário para Arquitetura ARM - BeagleBone

Este projeto é um executável compilado para ARM que precisa de algumas bibliotecas adicionais para ser executado na BeagleBone. Este guia explicará quais são as bibliotecas necessárias, como configurar o ambiente na BeagleBone e os passos para transferir e executar o programa.

## Dependências

As seguintes bibliotecas são necessárias para o funcionamento do executável `eesc-aero-embedded-systems`:

- **Armadillo**: Biblioteca de álgebra linear.
- **Lely CANopen** (`liblely-*`): Conjunto de bibliotecas necessárias para o suporte ao protocolo CANopen, utilizado para comunicação CAN no projeto. As bibliotecas `liblely-*` incluem:
  - `liblely-coapp.so`
  - `liblely-io.so`
  - `liblely-co.so`
  - `liblely-util.so`
  - E outras variantes (`.so`, `.so.2.3.0`, etc.) para o funcionamento completo da biblioteca.

## Preparando o Ambiente na BeagleBone

### Passo 1: Transferindo o Executável e as Bibliotecas

Para executar o programa na BeagleBone, é necessário transferir o executável e as bibliotecas. Use o `scp` para copiar os arquivos necessários do seu computador para a BeagleBone.

1. **Transfira o executável** `eesc-aero-embedded-systems` e as bibliotecas `liblely-*` para a BeagleBone. No terminal do seu computador, execute os seguintes comandos (substituindo `<IP_da_BeagleBone>` pelo IP real da sua BeagleBone):

2. **Configurando o Caminho das Bibliotecas**

