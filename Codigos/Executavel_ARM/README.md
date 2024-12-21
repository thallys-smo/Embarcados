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

Após transferir o executável e as bibliotecas para a BeagleBone, você precisará garantir que as bibliotecas compartilhadas estejam acessíveis no ambiente de execução. Para isso, siga os seguintes passos:

1. **Crie um diretório para armazenar as bibliotecas** (caso não tenha feito isso durante a transferência):

  ```bash
    mkdir -p /home/debian/libs
  ```

2. **Transfira as bibliotecas para o diretório libs**:

Se ainda não transferiu as bibliotecas, copie os arquivos .so e suas variantes para o diretório criado. Execute o comando abaixo para transferir os arquivos da sua máquina local para o diretório libs na BeagleBone:

  ```bash
    scp liblely-* debian@<IP_da_BeagleBone>:/home/debian/libs
  ```

3. **Atualize o caminho das bibliotecas**:

Para que o sistema reconheça as bibliotecas compartilhadas, adicione o caminho do diretório libs ao arquivo de configuração ld.so.conf:

  ```bash
    echo "/home/debian/libs" | sudo tee -a /etc/ld.so.conf.d/custom-libs.conf
  ```

4. **Recarregue a configuração das bibliotecas**:

Após adicionar o caminho ao arquivo de configuração, recarregue a configuração das bibliotecas com o comando:

  ```bash
    sudo ldconfig
  ```