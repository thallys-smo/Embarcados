# Guia de Uso para o Dockerfile e Estrutura Relacionada

Este README documenta a configuração e o uso do Dockerfile e das pastas associadas neste projeto. O objetivo é fornecer um ambiente replicável para desenvolvimento e execução de aplicações embarcadas utilizando ferramentas e bibliotecas como Lely Core.

---

## Estrutura de Diretórios

```
|-- Dockerfile                   # Arquivo principal para criação do ambiente Docker
|-- scripts/                     # Scripts de automação para construir e executar o contêiner
|   |-- build.sh                 # Script para compilar a imagem Docker
|   |-- run.sh                   # Script para executar o contêiner criado
|-- lely-core/                   # Fonte do Lely Core com arquivos de código e configuração
    |-- .sonar/                  # Configuração de análise estática
    |-- doc/                     # Documentação do Lely Core
    |-- docker/                  # Recursos Docker específicos do Lely Core
    |-- include/                 # Cabeçalhos usados no projeto
    |-- m4/                      # Macros auxiliares para autoconf
    |-- pkgconfig/               # Arquivos de configuração do pkg-config
    |-- python/                  # Componentes relacionados a Python
    |-- src/                     # Código-fonte principal do Lely Core
    |-- test/                    # Scripts e casos de teste
    |-- tools/                   # Ferramentas auxiliares
    |-- unit-tests/              # Testes unitários do projeto
    |-- Makefile                 # Arquivo principal de compilação
    |-- .clang-format            # Configuração de formatação de código
    |-- ax_*.m4                  # Macros auxiliares localizadas em `m4/`
```

---

## Descrição do Dockerfile

### Etapas Principais

1. **Builder:**
   - Configura a imagem base (Debian 11).
   - Instala as dependências necessárias, incluindo:
     - Compiladores e ferramentas como `gcc-arm-linux-gnueabihf`.
     - Bibliotecas como `libarmadillo-dev` para operações matemáticas.

2. **Builder-Lely-Core:**
   - Cria e instala o Lely Core em um diretório dedicado.
   - Utiliza ferramentas como `autoreconf` para configuração do build.

3. **Builder-Manopla:**
   - Configura o ambiente para a aplicação principal (controle de manopla).
   - Copia as dependências do Lely Core para o contêiner.
   - Configura o ambiente de desenvolvimento para um usuário específico.

### Variáveis Importantes
- **ARG UID=1000:** Define o ID do usuário no contêiner.
- **PKG_CONFIG_PATH:** Configura o caminho para bibliotecas instaladas no Lely Core.

---

## Scripts de Automação

### `build.sh`
- Constrói a imagem Docker baseada no Dockerfile.
- Uso:
  ```bash
  ./scripts/build.sh
  ```

### `run.sh`
- Inicia o contêiner a partir da imagem criada.
- Uso:
  ```bash
  ./scripts/run.sh
  ```

---

## Pasta Lely-Core

### Destaques
- **`m4/`**: Contém macros auxiliares para o sistema de construção `autoconf`. Exemplos:
  - `ax_check_python.m4`: Verifica a presença do Python no sistema.
  - `ax_valgrind_check.m4`: Adiciona suporte a Valgrind para depuração.

- **`pkgconfig/`**: Arquivos para configuração automática de pacotes usados no Lely Core.

### Nota Importante
Certifique-se de que os caminhos e dependências estejam configurados corretamente antes de executar os scripts ou compilar o projeto.

---

## Observações Finais

- Consulte a documentação em `lely-core/doc/` para detalhes específicos sobre as funcionalidades do Lely Core.
- Ajuste os scripts conforme suas necessidades específicas de ambiente.
- Certifique-se de que as dependências listadas no Dockerfile estejam instaladas corretamente antes de compilar.

Se precisar de ajuda adicional, entre em contato com o time de desenvolvimento.

