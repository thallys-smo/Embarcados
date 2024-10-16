# Embarcados: Sistema de Controle de Motor

## Descrição do Projeto

O **Sistema de Controle de Motor** é um sistema embarcado de controle de motores, utilizando protocolos como **CANopen** e bibliotecas da **Lely**. O projeto inclui código em C++ e Python, além de arquivos de configuração para comunicação CANopen e scripts para automatização de processos.

Este sistema é voltado para controlar motores em tempo real, fazendo uso de técnicas como controle PID, testes com bibliotecas de álgebra linear, e integração com containers Docker para facilitar o desenvolvimento.

## Estrutura de Arquivos

- **`.gitignore`**: Lista de arquivos e diretórios que serão ignorados no controle de versão Git.
  
- **`CMakeLists.txt`**: Arquivo de configuração do CMake para compilar o projeto. Inclui os parâmetros para a geração dos binários a partir dos arquivos `.cpp`.

- **`ManoplaLelyBBB.cpp` e `ManoplaLelyBBB.h`**: Implementação em C++ de uma "manopla" ou controle, utilizando as bibliotecas Lely, para comunicação via CANopen.

- **`README.general.md`**: Documentação geral do projeto, contendo informações sobre o funcionamento do sistema e como utilizá-lo.

- **`REAME.pid.md`**: Documentação focada na implementação de controle PID (Proporcional-Integral-Derivativo) no projeto, explicando o comportamento e como ajustar os parâmetros.

- **`arma-col-test` e `arma-col-test.cpp`**: Arquivos relacionados a testes de colisão ou controle utilizando a biblioteca **Armadillo** (usada para álgebra linear e manipulação de matrizes).

- **`canopen-manual.sh`**: Script bash para automação de processos relacionados à comunicação CANopen. Facilita a configuração e inicialização de dispositivos.

- **`cartpdf.pdf`**: Documento em PDF, possivelmente contendo especificações técnicas ou diagramas do projeto.

- **`datadriven_modeling.py`**: Script em Python para modelagem de dados, provavelmente relacionado a algum teste ou controle baseado em dados no sistema.

- **`dockerfile`**: Arquivo de configuração Docker para construir o ambiente de desenvolvimento dentro de um container. Isso facilita a replicação do ambiente e garante que as dependências estejam adequadas.

- **`epos_com_motorzao_limitado_5000.eds`**: Arquivo de Descrição de Dispositivo (EDS) para o motor, utilizado em sistemas CANopen para definir as características do dispositivo e como ele se comunica com o barramento CAN.

- **`evolucao-angulo-corrente-transiente.png`**: Imagem que parece representar a evolução de algum parâmetro do sistema, como o ângulo ou a corrente durante um transiente.

- **`lely-libs/`**: Diretório contendo bibliotecas Lely para implementar a comunicação via CANopen.

- **`main.cpp`**: Arquivo principal do projeto, contendo a lógica central de controle dos motores e comunicação com os dispositivos.

- **`master-dcf-motorzao-current-5000.bin`, `master-dcf-motorzao-current-5000.dcf`, `master-dcfgen.yml`**: Arquivos relacionados à configuração do Controlador de Dispositivo (DCF), utilizados para configurar os parâmetros e características do motor controlado via CANopen.

- **`utils/`**: Pasta com scripts ou utilitários que auxiliam no desenvolvimento e uso do sistema.

## Como Utilizar

### Pré-requisitos

- **Docker** (caso deseje usar o ambiente contido no Dockerfile)
- **CMake** para compilar o projeto
- Bibliotecas **Lely** para comunicação CANopen
- Bibliotecas **Armadillo** para testes com álgebra linear

### Passos para Execução

1. **Clonar o Repositório:**

```bash
   git clone https://github.com/thallys-smo/Embarcados.git
   cd Embarcados
```

2. **Docker - Automatizações:**

Dentro da pasta **Dockerfile/scripts, temos dois scripts de automatização: 

* **Script de Build:** Automatização da construção das Imagem Docker para uma ambiente de desenvolvimento de projeto. 

```bash
   scripts/build.sh
```
* **Script de Run:** Automação do acesso do container com configurações pré-configuradas. 

```bash
   scripts/run.sh
```
