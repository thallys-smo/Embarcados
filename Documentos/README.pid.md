# Guia Prático para Ajuste de Controle PID

Este documento fornece uma introdução rápida e descomplicada ao método de Ziegler-Nichols para configurar os parâmetros do controle PID (Proporcional, Integral e Derivativo). Aqui você encontrará instruções claras e exemplos para aplicar as configurações no seu sistema.

---

## O Que é o Controle PID?

O controle PID é uma técnica usada para ajustar a resposta de um sistema controlado. Ele utiliza três componentes principais:
- **Proporcional (P):** Reage ao erro atual.
- **Integral (I):** Considera o histórico do erro.
- **Derivativo (D):** Prevê o futuro com base na taxa de mudança do erro.

O objetivo é encontrar os parâmetros certos para que o sistema opere de forma estável e eficiente.

---

## Método de Ziegler-Nichols

Este método ajuda a determinar os parâmetros \( Kp \), \( Ki \) e \( Kd \) para diferentes tipos de controle.

1. **Defina o ganho proporcional \( Ku \):** Este é o maior ganho proporcional que faz o sistema oscilar de forma estável, sem ganhos integral ou derivativo.
2. **Meça o período de oscilação \( Tu \):** Tempo entre os ciclos da oscilação.
3. **Aplique as fórmulas a seguir:**

| Tipo de Controle |   \( Kp \)    |   \( Ti \)   |    \( Td \)   |     \( Ki \)      |      \( Kd \)       |
|:----------------:|:------------:|:------------:|:-------------:|:-----------------:|:-------------------:|
| **Proporcional** (P) | \( 0.5 \cdot Ku \) |       -        |         -         |          -          |          -          |
| **Proporcional-Integral** (PI) | \( 0.45 \cdot Ku \) | \( 0.83 \cdot Tu \) |         -         | \( 0.54 \cdot Ku / Tu \) |          -          |
| **Proporcional-Derivativo** (PD) | \( 0.8 \cdot Ku \) |       -        | \( 0.125 \cdot Tu \) |          -          | \( 0.10 \cdot Ku \cdot Tu \) |
| **PID Clássico** | \( 0.6 \cdot Ku \) | \( 0.5 \cdot Tu \) | \( 0.125 \cdot Tu \) | \( 1.2 \cdot Ku / Tu \) | \( 0.10 \cdot Ku \cdot Tu \) |
| **Sem Sobressinal** | \( 0.2 \cdot Ku \) | \( 0.5 \cdot Tu \) | \( (1/3) \cdot Tu \) | \( 0.40 \cdot Ku / Tu \) | \( (2/30) \cdot Ku \cdot Tu \) |

---

## Exemplo Prático: Configuração Sem Sobressinal

1. **Determine os valores iniciais:**
   - \( Ku = 650 \)
   - \( Tu = 300 \, ms = 0.3 \, s \)

2. **Calcule os parâmetros:**
   - \( Kp = 0.2 \cdot Ku = 0.2 \cdot 650 = 130 \)
   - \( Ki = 0.4 \cdot Ku / Tu = 0.4 \cdot 650 / 0.3 = 78 \)
   - \( Kd = (2/30) \cdot Ku \cdot Tu = (1/15) \cdot 650 \cdot 0.3 = 13 \)

3. **Configure seu sistema:** Insira esses valores no controle PID.

---

## Recursos Adicionais
- Referência para estudo: [Ziegler-Nichols (Wikipedia)](https://en.wikipedia.org/wiki/Ziegler%E2%80%93Nichols_method)

Se tiver dúvidas ou precisar de ajuda, consulte o manual do sistema ou entre em contato com a equipe de suporte (o Grilo).

