# Sistema Embarcado: Controle de Motor e Manopla de Fisioterapia

## Descrição do Projeto

O projeto implementa um sistema embarcado multifuncional, voltado para o controle de motores e uma manopla utilizada em sessões de fisioterapia. Com ênfase em desempenho em tempo real, o sistema integra bibliotecas externas, protocolos como **CANopen**, e suporte a técnicas de controle como PID, além de automação via Docker para um ambiente de desenvolvimento replicável e eficiente.

### Funcionalidades principais:
- Controle em tempo real de dispositivos utilizando CANopen.
- Implementação de controle PID com ajustes automáticos de parâmetros.
- Integração de bibliotecas como Lely e Armadillo para comunicação e cálculos matemáticos.
- Suporte ao desenvolvimento e execução em containers Docker.

---

## Estrutura de Arquivos

```
|-- dockerfile                   # Configurações para contêiner Docker
|-- lely-libs/                   # Bibliotecas externas utilizadas no projeto
|-- utils/
|   |-- json.h                   # Manipulação de JSON
|   |-- utils.cpp                # Funções auxiliares
|   |-- utils.h                  # Definição de funções auxiliares
|-- ManoplaLelyBBB.cpp           # Controle específico da manopla
|-- ManoplaLelyBBB.h             # Definição de funções e constantes
|-- main.cpp                     # Ponto de entrada do sistema
|-- CMakeLists.txt               # Configurações de compilação
|-- README.general.md            # Documentação geral
|-- README.pid.md                # Documentação sobre o controle PID
|-- arquivos diversos (e.g., binários e configurações)
```

---

## Detalhes do Funcionamento

### Arquivo Principal: *main.cpp*
O *main.cpp* é o ponto central do sistema, com as seguintes funções:
- **Configuração Inicial:** Define constantes e configura o ambiente de execução.
- **Controle de Eventos:** Implementa funções como *event()* e *super_event()*, que realizam cálculos matemáticos e operações relacionadas ao controle.
- **Sincronização Temporal:** Utiliza *std::chrono::high_resolution_clock* para medições precisas de tempo.
- **Integração com Outros Módulos:** Depende de *ManoplaLelyBBB.h* para funcionalidades específicas de controle da manopla.

### Controle PID (*README.pid.md*)
O sistema utiliza o método de Ziegler-Nichols para ajustes automáticos dos parâmetros do controle PID:
- **Kp:** Ganho proporcional
- **Ki:** Ganho integral
- **Kd:** Ganho derivativo

Documentação detalhada para o ajuste dos parâmetros encontra-se em *README.pid.md*, incluindo cálculos e referências teóricas.

---

## Requisitos para Compilação e Execução

### Ferramentas Necessárias:
- **Compilador:** GCC/G++ (versão 9 ou superior recomendada)
- **CMake:** Versão 3.10 ou superior
- **Docker:** Para ambiente isolado de desenvolvimento

### Dependências:
- **Bibliotecas Lely:** Para comunicação via CANopen
- **Armadillo:** Para operações matemáticas e de álgebra linear

### Passos para Execução:

1. Clone o repositório:
```bash
   git clone <URL do repositório>
   cd <diretório-do-projeto>
```

2. Compile o projeto:
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

---

## Docker: Configurações e Scripts

O projeto inclui suporte a Docker para automação do ambiente:

- **Build do Ambiente:**
```bash
   scripts/build.sh
```
- **Execução do Contêiner:**
```bash
   scripts/run.sh
```

