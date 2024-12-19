# Identificação de Sistemas Baseada em Dados

Este documento fornece uma visão geral sobre a identificação de sistemas utilizando dados registrados, com exemplos claros de entradas, saídas e soluções para problemas comuns durante a configuração.

---

## Descrição do Processo

A identificação de sistemas baseada em dados consiste em modelar o comportamento dinâmico de um sistema a partir de logs de entrada e saída. No caso deste projeto, o foco é utilizar dados registrados para gerar matrizes \( A \) e \( B \), além de obter os ganhos \( K \) de um controlador Linear Quadrático Regulado (dLQR).

---

## Entrada: Log de Dados

O arquivo **log_2023_09_06-13_17_50-openloop.log** contém as medições brutas do sistema em um experimento de malha aberta. Este log registra as seguintes informações:
- **Entradas aplicadas ao sistema:** Sinais que foram enviados para controlar o sistema.
- **Saídas observadas:** Respostas do sistema a essas entradas.

Esses dados são utilizados como entrada para o processo de identificação, que calcula os parâmetros dinâmicos do modelo.

---

## Saída: Parâmetros Calculados

Com base nos dados de entrada, os seguintes parâmetros foram obtidos:

1. **Matriz A Good:** Representa as dinâmicas internas do sistema. Exemplo:
    ```
    A Good:
        [[ 2.82975412e-15  1.00000000e+00]
         [-9.80269531e-01  1.97873008e+00]]
    ```
   - A primeira linha reflete os coeficientes de realimentação.
   - A segunda linha mostra os efeitos das entradas passadas sobre o estado atual.

2. **Matriz B Good:** Define como as entradas afetam os estados do sistema. Exemplo:
    ```
    B Good:
        [[1.84982170e-15]
         [6.72172757e-03]]
    ```
   - Os valores representam as influências das entradas diretas sobre os estados do sistema.

3. **Ganhos \( K \) do dLQR:** Calculados utilizando a função de custo definida por:
    - \( Q = \text{eye}(2) \) (penalização sobre os estados)
    - \( R = \text{eye}(1) \) (penalização sobre a entrada de controle)
    
   Resultado:
    ```
    K:
        [[ 15.12857803 -16.25584753]]
    ```
   - Esses valores indicam a relação ideal entre os estados do sistema e as ações de controle para minimizar o custo.

---

## Resolução de Problemas Comuns

### Erro: "cannot create CAN controller"

Este erro ocorre quando o sistema não consegue inicializar o dispositivo CAN devido a configurações incorretas ou conflitos.

#### Solução:
1. Certifique-se de que o nome da interface CAN e o bitrate estão corretos.
2. Execute os seguintes comandos para reconfigurar o controlador CAN:

```bash
CAN=<nome da interface CAN>
BITRATE=<seu bitrate CAN>
ip link set ${CAN} down
ip link set ${CAN} type can bitrate ${BITRATE}
ip link set ${CAN} txqueuelen 1000 # esta é a solução :)
ip link set ${CAN} up
```
3. Consulte a [documentação oficial](https://gitlab.com/lely_industries/lely-core/-/issues/49) para mais informações.