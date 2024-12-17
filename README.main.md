# README - Sistema de Controle para Manopla de Fisioterapia

## Descrição do Projeto
Este projeto implementa um sistema embarcado para controle de uma manopla utilizada em sessões de fisioterapia. O código realiza operações matemáticas, medição de tempo em alta precisão e controle de dispositivos, utilizando bibliotecas externas e arquivos auxiliares para garantir o funcionamento em tempo real.

## Estrutura do Projeto
O projeto está organizado da seguinte maneira:

```
|-- dockerfile                   # Configurações para contêiner Docker
|-- lely-libs/                   # Bibliotecas externas utilizadas no projeto
|-- utils/
|   |-- json.h                   # Manipulação de JSON (se aplicável)
|   |-- utils.cpp                # Implementação de funções auxiliares
|   |-- utils.h                  # Definição de funções auxiliares
|-- ManoplaLelyBBB.cpp           # Implementação de controle específico da manopla
|-- ManoplaLelyBBB.h             # Definição de funções e constantes
|-- main.cpp                     # Ponto de entrada principal do código
|-- CMakeLists.txt               # Configurações de compilação
|-- README.general.md            # Documentação geral do projeto
|-- REAME.pid.md                 # Informações específicas sobre PID
|-- outros arquivos...
```

## Funcionamento do Código
### **main.cpp** (Ponto de Entrada)
O `main.cpp` é o arquivo principal do projeto e possui as seguintes funcionalidades:
- **Configuração Inicial**: Define constantes e prepara o ambiente de execução.
- **Funções de Evento**: `event()` e `super_event()` realizam operações matemáticas para controle da manopla.
- **Sincronização**: Utiliza `std::chrono::high_resolution_clock` para medir tempos com alta precisão.
- **Interação com Arquivos Auxiliares**: Depende de `ManoplaLelyBBB.h` para controle específico.

### **Arquivos Auxiliares**
- `ManoplaLelyBBB.cpp/h`: Contém funções específicas para controle e manipulação da manopla.
- `utils.cpp/h`: Fornece funções utilitárias utilizadas ao longo do projeto.

## Requisitos
- **Compilador**: GCC/G++ (recomendado: versão 9 ou superior)
- **CMake**: Versão 3.10 ou superior
- **Bibliotecas**:
  - Armadillo (para operações matemáticas)
  - Bibliotecas próprias no diretório `lely-libs`

## Como Compilar e Executar
1. Clone o repositório:
   ```bash
   git clone <URL do repositório>
   cd <diretório-do-projeto>
   ```

2. Crie o diretório de build e compile:
   ```bash
   mkdir build
   cd build
   cmake ..
   make
   ```

3. Execute o programa:
   ```bash
   ./main
   ```

## Observações
- Certifique-se de que todas as bibliotecas dependentes estejam instaladas corretamente.
- Verifique o arquivo **CMakeLists.txt** para ajustar configurações, caso necessário.


