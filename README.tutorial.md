# Tutorial: Preparando a BeagleBone Black Wireless e Deploy do Projeto

Este tutorial detalha os passos para preparar a BeagleBone Black Wireless, instalar o sistema operacional Debian, configurar a conectividade e realizar o deploy do projeto.

## 1. Verificar o Modelo da BeagleBone

Certifique-se do modelo correto da placa. Este tutorial foi feito para a **BeagleBone Black Wireless**.

## 2. Escolher o Cartão SD Adequado

Para os requisitos do projeto, recomendamos um **cartão SD de pelo menos 16 GB**. Cartões menores, como 8 GB, podem não ser suficientes.

## 3. Baixar a Imagem do Sistema Operacional

1. Acesse o [site oficial da BeagleBone](https://www.beagleboard.org/distros) e baixe a imagem do **Debian** apropriada para a BeagleBone Black Wireless.

## 4. Flashar a Imagem no Cartão SD

### Ferramentas Necessárias:
- **Win32DiskManager** (Windows) ou **balenaEtcher** (Windows/Linux/Mac).

### Passos:
1. **Formate o cartão SD** para FAT32. Isso pode ser feito diretamente pelo explorador de arquivos do seu computador.
2. **Flashar a imagem**:
   - **Com balenaEtcher**: Basta selecionar a imagem `.img` e o cartão SD. O programa descompacta automaticamente.
   - **Com Win32DiskManager**: Caso a imagem esteja compactada, descompacte antes de iniciar.
3. Ao concluir, **ejete o cartão SD** com segurança.

## 5. Iniciar a BeagleBone com o Cartão SD

1. Com a BeagleBone **desligada**, insira o cartão SD no slot localizado na parte inferior da placa.
2. **Pressione e segure o botão de boot** (próximo ao slot do cartão SD).
3. **Ligue a alimentação da placa (5V)** enquanto mantém o botão pressionado.
4. Solte o botão assim que os **LEDs 0-3** acenderem.
5. Aguarde cerca de **1 minuto**. O processo será concluído quando o **LED 0** piscar no padrão **heartbeat** (batida de coração).

## 6. Conectar a BeagleBone ao Computador

1. Conecte a BeagleBone ao computador via **USB**.
2. A placa deve ser reconhecida e aparecer como uma unidade de armazenamento no explorador de arquivos.
3. **Verificar comunicação**:
   - No **Windows**, utilize o software **PuTTY** para conexão SSH.
   - No **Linux/Mac**, use o terminal diretamente.

**IP padrão**:
- Windows: `192.168.7.2`
- Linux/Mac: `192.168.6.2`

### Conexão SSH:
```bash
ssh debian@192.168.7.2
```
- Usuário: `debian`
- Senha: `temppwd`

### Teste a Conexão:
- No PC:  
   ```bash
   ping 192.168.7.2
   ```
- Na BeagleBone:  
   ```bash
   ping 192.168.7.1  # IP do seu computador
   ```
   
Se tudo estiver correto, a comunicação está funcionando.

## 7. Conectar a BeagleBone ao Wi-Fi

Como estamos usando a **BeagleBone Black Wireless**, podemos configurar a rede Wi-Fi diretamente:

### Passos:
1. Acesse o terminal logado na BeagleBone.
2. Execute os seguintes comandos:
   ```bash
   sudo connmanctl
   enable wifi
   scan wifi
   services
   agent on
   connect <SSID-da-Rede>
   ```
3. Digite a senha da rede quando solicitado.
4. Saia do modo de configuração:
   ```bash
   quit
   ```
5. Teste a conexão:
   ```bash
   ping 8.8.8.8
   ping google.com
   ```

### Alternativa: Conectar via USB

Caso não seja possível usar Wi-Fi ou Ethernet:
- A [conexão USB](https://ofitselfso.com/BeagleNotes/HowToConnectBeagleboneBlackToTheInternetViaUSB.php) pode ser usada para compartilhar a internet do computador com a BeagleBone.
- Certifique-se de utilizar um **bom cabo USB**.

## 8. Deploy do Projeto

Agora que a BeagleBone está configurada e conectada à rede:
1. Clone o repositório do projeto na BeagleBone:
   ```bash
   git clone <URL-do-repositorio>
   cd <nome-do-projeto>
   ```
2. Compile o projeto (se necessário):
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

## Conclusão

Com isso, sua BeagleBone Black Wireless está configurada, conectada à internet e pronta para rodar o projeto. Caso tenha dúvidas ou encontre problemas, revise os passos e teste novamente.

