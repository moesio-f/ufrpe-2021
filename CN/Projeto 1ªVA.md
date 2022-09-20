- [Projeto 1ªVA](#projeto-1ªva)
  - [Parte 1: VLSM](#parte-1-vlsm)
    - [Sub-rede 500 hosts](#sub-rede-500-hosts)
    - [VLAN 35 - 100 hosts](#vlan-35---100-hosts)
    - [VLAN 25 - 50 hosts](#vlan-25---50-hosts)
  - [Parte 2: Implementação](#parte-2-implementação)
    - [1. Criação dos Hosts](#1-criação-dos-hosts)
    - [2. Adicionar router](#2-adicionar-router)
    - [3. Adicionar switch](#3-adicionar-switch)
    - [4. Adicionar NAT](#4-adicionar-nat)
    - [4. Configuração do EtherSwitch: VLANs](#4-configuração-do-etherswitch-vlans)
    - [5. Configuração do Roteador](#5-configuração-do-roteador)

---
# Projeto 1ªVA

## Parte 1: VLSM

- CPF: 068 = total de IP's fixos e reservados 14
- Endereço da rede: `10.1.0.0/16`
- Endereços reservados: `10.1.0.0/16` - `10.1.13.0/16`
- Primeiro IP válido: `10.1.13.1`

Para dividir os endereços para todas as VLANs usando VLSM, devemos iniciar com a VLAN de maior tamanho.

### Sub-rede 500 hosts

Para 500 hosts, precisamos de pelo menos `9` bits ($2^9 = 512$). Dessa forma, precisamos utilizar a seguinte máscara:

> `11111111.11111111.11111110.00000000`, ou seja, `255.255.254.0` já que possuímos `9` bits para representação dos hosts.

O menor endereço para essa sub-rede com a máscara `/23` que podemos utilizar de forma que ele venha após `10.1.13.0` é o `10.1.14.0/23`.

Assim, temos os seguintes endereços para essa VLAN:

- **Endereço da Rede**: `10.1.14.0/23` (primeiro endereço)
- **Endereço de Broadcast**: `10.1.15.255` (último endereço)
  - `10.1.14.0` -> `00001010.00000001.00001110.00000000`
  - `00001010.00000001.00001111.11111111` -> `10.1.15.255` (and máscara + flip últimos bits)
- **Default Gateway**: `10.1.14.1`
- **Restante**: `10.1.14.2` - `10.1.15.254`

### VLAN 35 - 100 hosts

Para 100 hosts, precisamos de pelo menos `7` bits ($2^7 = 128$). Assim, precisamos utilizar a seguinte máscara de rede:

> `11111111.11111111.11111111.10000000`, ou seja, `255.255.255.128`.

O menor endereço para essa sub-rede com a máscara `/25` que podemos utilizar de forma que ele venha após `10.1.15.255` é o `10.1.16.0/25`.

- **Endereço da Rede**: `10.1.16.0/25`
- **Endereço de Broadcast**: `10.1.16.127`
  - `10.1.16.0` --> `00001010.00000001.00010000.00000000`
  - `00001010.00000001.00010000.01111111` -> `10.1.16.127`
- **Default Gateway**: `10.1.16.1`
- **Restante**: `10.1.16.2` - `10.1.16.126`

### VLAN 25 - 50 hosts

Para 50 hosts, precisamos de pelo menos `6` bits ($2^6 = 64$). Assim, precisamos utilizar a seguinte máscara de rede:

> `11111111.11111111.11111111.11000000`, ou seja, `255.255.255.192`.

O menor endereço para essa sub-rede com a máscara `/26` que podemos utilizar de forma que ele venha após `10.1.16.127` é o `10.1.16.128/26`.


- **Endereço da Rede**: `10.1.16.128/26`
- **Endereço de Broadcast**: `10.1.16.191`
  - `10.1.2.128` --> `00001010.00000001.00010000.10000000`
  - `00001010.00000001.00010000.10111111` -> `10.1.16.191`
- **Default Gateway**: `10.1.16.129`
- **Restante**: `10.1.16.130` - `10.1.16.190`

## Parte 2: Implementação

### 1. Criação dos Hosts

- Dois hosts básicos: um para VLAN35, outro para VLAN25.
- Podemos adicionar mais hosts no futuro.
- Visto que vamos utilizar DHCP, podemos simplesmente alterar o arquivo de configuração (caso container docker) expondo a parte do DHCP.
- Os hosts não possuem mais configurações nesse momento.

### 2. Adicionar router

- Podemos adicionar um router Cisco Catalyst qualquer (e.g., c7200) e configurar seus slots: `C7200-IO-2EF` (ou variantes que exponham 2+ interfaces FastEthernet).

### 3. Adicionar switch

> Vamos utilizar o EtherSwitch, que contém o protocolo proprietário da Cisco: VTP (VLAN Trunk Protocol). O intuito, é já facilitar o processo de configuração da rede em caso de extensões ou alteração na quantidade de hosts através dos mecanismos de sincronização entre os switches.
> 
> Caso algum dos links seja compartilhado entre múltiplas VLANs, precisamos não apenas utilizar CSMA/CD bem como precisamos utilizar *trunking* (IEEE 802.1Q) para garantir a identificação das VLANs.
> 
> As tags de VLAN são transportadas no quadro Ethernet quando utilizamos o IEEE 802.1Q, todavia, precisamos de dispositivos que sejam tanto capazes de gerar essas tags como reconhecerem elas. O EtherSwitch no nosso caso é responsável por adicionar as tags de acordo com a interface de origem, e precisamos alertar ao Router que o link entre ele o switch vai possuir essas informações.

- Podemos simplesmente adicionar o EtherSwitch e realizar suas conexões nas interfaces.
- Link para o router (`f1/0` para `f0/1`)
- Links para VLAN 35 (`f1/1-7`) e VLAN 25 (`f1/8-15`)

### 4. Adicionar NAT

> *Network address translation (NAT) is a method of mapping an IP address space into another by modifying network address information in the IP header of packets while they are in transit across a traffic routing device. The technique was originally used to avoid the need to assign a new address to every host when a network was moved, or when the upstream Internet service provider was replaced, but could not route the network's address space. It has become a popular and essential tool in conserving global address space in the face of IPv4 address exhaustion. One Internet-routable IP address of a NAT gateway can be used for an entire private network.*

- O NAT deve ser conectado diretamente ao roteador;

Seguindo os passos até o momento, deveríamos ter algo similar ao da figura:

![IMG](GNS3-Initial.jpeg)

### 4. Configuração do EtherSwitch: VLANs

> Usamos `wr` em qualquer momento para salvarmos as configurações.
> 

- Iniciamos cadastrando as VLANs através das configurações do EtherSwitch: `vlan database`
- Cadastramos as VLANs no banco: `vlan {N} name {NAME}`
  - Perceba que não devemos cadastrar a VLAN com 500 hosts nesse switch, pois estes serão hosts remotos.
  - `exit` para sair do contexto de configuração de VLANs.
- Agora, devemos configurar as interfaces para adicionar as tags para as VLANs. Para fazer isso, devemos entrar no modo de configuração: `conf t`
  - Devemos agora entrar na configuração das interfaces: `interface range FastEthernet 1/X - Y`
  - Agora, podemos definir qual o modo para essas interfaces: `switchport mode {access|trunk}`
    - O modo `access` deve ser utilizado já que essas interfaces só serão utilizadas por uma das VLANs, não sendo necessário o *trunking*.
  - Em seguida, determinamos qual VLAN que utiliza essas interfaces: `switchport access {vlan name}`
  - Por último, podemos iniciar essas interfaces: `no sh`
- Finalizamos a configuração básica do EtherSwitch para os hosts!! Agora falta configurarmos o link entre o EtherSwitch e o roteador :D

- Devemos agora acessar (`conf t`) a interface conectada ao roteador, setar o modo do link para `trunk`, e adicionar quais VLANs podem trafegar nesse link (`switchport trunk allowed vlan 25, 35, 1-2, 1002-1005`) e ligá-la (`no sh`).
  - [Detalhes sobre configuração.](https://community.cisco.com/t5/networking-knowledge-base/how-to-define-the-vlans-allowed-on-a-trunk-link/ta-p/3131083#:~:text=VLANs%201%20through%201005%20are,passing%20over%20the%20trunk%20link.)

### 5. Configuração do Roteador

- Para o roteador, temos 2 interfaces para configurar: a interface conectado ao NAT, e a interface conectada ao EtherSwitch.
- Começando pela do EtherSwitch, temos 2 configurações: *Trunking* e *Servidor DHCP*.
  - Entrar nas configurações do roteador (`conf t`)
  - Adicionar pools DHCP: `ip dhcp pool {ID}`
  - Agora, devemos utilizar as informações que temos sobre as nossas sub-redes.
  - Primeiro, vamos determinar rede e máscara da VLAN escolhida: `network {network} {mask}`
  - Depois, vamos determinar o *gateway padrão* que será recebido através do DHCP: `default-router {IP}`
  - Adicionalmente, podemos adicionar o servidor DNS a ser utilizado: `dns-server {IP}`
  - Podemos sair da configuração DHCP atual: `exit`
  - Repetimos esse processo para todas as VLANs.
  - Acessar a configuração de uma sub-interface `interface f0/1.{TAG}` para permitir o funcionamento do *trunking*.
  - Setar a encapsulação usada no link (dot1Q por padrão, poderia ser ISL): `encapsulation DOt1A {TAG_VLAN}`
  - Adicionar o IP padrão dessa interface (gateway padrão da VLAN sendo configurada): `ip address {IP} {MASK}`
  - Repetir para todas VLANs que passarão pelo link entre o router e switch.
  - Por último, habilitar a interface `f0/1` (conectada ao EtherSwitch) e sair: `conf t` -> `int f0/1` -> `no sh` -> `exit`
  - Finalizada configuração da interface do EtherSwitch!
- Agora, podemos iniciar a configuração da interface ligada ao NAT.
  - Primeiro, vamos entrar no modo de configuração: `conf t`
  - Depois, vamos acessar a interface: `int f0/0`
  - Agora, habilitamos essa interface para receber seu IP através do DHCP provido pelo NAT: `ip address dhcp`
  - Configuramos que essa interface representa o *outside NAT*: `ip nat outside`
  - Habilitamos essa interface: `no sh`
  - Agora, podemos configurar a lista de acesso: `access-list {NUMBER} permit 10.1.0.0 0.0.255.255` (permitimos que todos os hosts na rede acessem a Internet)
  - Bem como, podemo criar um pool de transcrição entre IP locais internos e IP locais externos: `ip nat pool {NAME} {START_IP} {END_IP} prefix {SUBNET_MASK_CIDR}` (no nosso caso, vamos utilizar NAT overloading pois temos apenas um IP local externo)
  - Depois, configuramos a sub-interface `f0/1.{TAG}` como *inside NAT*: `ip nat inside`
  - Por último, configuramos que todos inside NAT devem utilizar a lista de acesso definida: `ip nat inside source list {NUMBER} pool {NAME} overload`