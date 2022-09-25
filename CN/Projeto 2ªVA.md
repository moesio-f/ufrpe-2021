- [Projeto 2ªVA](#projeto-2ªva)
  - [1. Layout: roteadores, switches, hosts](#1-layout-roteadores-switches-hosts)
  - [2. Roteamento: OSPF vs RIP?](#2-roteamento-ospf-vs-rip)
    - [Configuração do OSPF para o C7200](#configuração-do-ospf-para-o-c7200)
    - [Configuração do Firewall para o C7200](#configuração-do-firewall-para-o-c7200)
  - [Máscaras Wildcard](#máscaras-wildcard)

---
# Projeto 2ªVA

## 1. Layout: roteadores, switches, hosts

![IMG](imgs/GNS3-Project-2.png)

- Estamos usando uma interface serial pois devemos considerar que os roteadores não estão na mesma LAN (dessa forma, estamos utilizando uma WAN).

1. Agora, precisamos fazer a configuração da VLAN com 500 hosts (VLAN500).
2. Por simplicidade, vamos considerar que apenas a VLAN500 se conecta com o roteador R2. 
3. Assim, só precisamos configurar os endereços IP de cada um dos hosts de forma individual.
    | IP address | Servidor | 
    | --- | --- |
    | 10.1.14.2 /23 | DNS |
    | 10.1.14.3 /23 | WEB (página) |
    | 10.1.14.4 /23 | FTTP |
    | 10.1.14.5 /23 | HTTP (calculadora) |
   - [Mais detalhes na documentação da CISCO](https://www.cisco.com/c/en/us/td/docs/ios/12_2sb/12_2sba/feature/guide/sbhcpsm.html)
   - [Mais detalhes na documentação da CISCO](https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/ipaddr_dhcp/configuration/15-mt/dhcp-15-mt-book/config-dhcp-server.html#GUID-68D87544-7C6F-48C9-9DFE-56F5B7E4A89D)
4. Agora, podemos configurar o roteador R2.
   - `conf t`
   - `int FastEthernet 0/0`
   - `ip address 10.1.14.1 255.255.254.0`
   - `no sh`
   - `end`

## 2. Roteamento: OSPF vs RIP?

> Ambos são viáveis e possuem mais de uma versão. Em particular, o RIPv1 não pode ser utilizado pois não consegue lidar com sub-redes IP.
> 
> O RIP precisa continuamente enviar informações sobre o roteamento nos canais de comunicação, já o OSPF só envia quando alguma atualização ocorre na rede.
> 
> O RIP foi feito para trabalhar em redes de tamanho moderado, já o OSPF consegue trabalhar em redes maiores.
> 
> Mais informações que podem auxiliar na escolha: https://www.ibm.com/docs/en/zos/2.1.0?topic=terminology-interior-gateway-protocols

Inicialmente, vamos escolher o **OSPFv2** (apesar dele possuir uma configuração um pouco mais complicada) por ele só compartilhar informações sobre o roteamento quando a topologia da rede é alterada. Ademais, vamos utilizar a versão 2 pois só estamos trabalhando com redes IPv4.

### Configuração do OSPF para o C7200

> Referências:
> - https://www.cisco.com/c/en/us/support/docs/ip/open-shortest-path-first-ospf/7039-1.html
> - https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/iproute_ospf/configuration/xe-16/iro-xe-16-book/iro-cfg.html
> - https://www.dltec.com.br/blog/cisco/configurando-o-ospf-single-area-para-ccnas/
> - https://www.cisco.com/c/en/us/support/docs/ip/open-shortest-path-first-ospf/13687-15.html
> - https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/iproute_ospf/configuration/xe-3e/iro-xe-3e-book/iro-mode-ospfv2.pdf
> - https://www.cisco.com/c/en/us/support/docs/ip/open-shortest-path-first-ospf/47868-ospfdb9.html
> - https://study-ccna.com/ospf-default-information-originate/

> *The OSPF protocol is based on link-state technology, which is a departure from the Bellman-Ford vector based algorithms used in traditional Internet routing protocols such as RIP. OSPF has introduced new concepts such as authentication of routing updates, Variable Length Subnet Masks (VLSM), route summarization, and so forth.*

> *OSPF uses flooding to exchange link-state updates between routers. Any change in routing information is flooded to all routers in the network. Areas are introduced to put a boundary on the explosion of link-state updates. Flooding and calculation of the Dijkstra algorithm on a router is limited to changes within an area.*

- **Quais/quantas áreas devemos possuir?** Precisamos apenas de de backbone, visto que nossa topologia é extremamente simples.
- Nos roteadores CISCO, o OSPF é habilitado apenas nas interfaces configuradas utilizando o comando `network {IP} {WILDCARD} area {N}`.

1. Inicialmente, vamos configurar o roteador `R2`. Iremos utilizar OSPF.
   1. A primeira etapa é entrar no modo de configuração: `conf t`
   2. Agora, devemos declarar a interface `s3/0` como não numerada.
      - `int Serial 3/0`
      - `ip address 10.1.1.0 255.255.255.254`
      - `encapsulation ppp`: o PPP (Point-to-Point Protocol) é um protocolo que permite a comunicação direta entre dois roteadores.
      - `no sh`
      - `exit`
   3. Depois, entrar na configuração do OSPF: 
      - `router ospf {PROCESS_ID}` ( valor do `PROCESS_ID` não precisa ser o mesmo para os demais roteadores, irei selecionar o valor `1`).
      - `network 10.1.14.0 0.0.1.255 area 0`
      - `network 10.1.1.0 0.0.0.1 area 0`
      - `end`
2. Agora, podemos realizar o mesmo processo no roteador `R1`.
   - A única diferença, são: o IP da interface serial (`10.1.1.1 255.255.255.254`) e as redes do OSPF (devemos usar ambas VLANs).
   - Ademais, também precisamos indicar que esse roteador possui a rota padrão (*Gateway Last Resort*): `default-information originate`
   - Adicionalmente, podemos colocar a interface serial desse roteador como sendo dentro do NAT (`ip nat inside`). 

### Configuração do Firewall para o C7200

- Vamos bloquear ICMPs;
- Vamos bloquear alguns hosts;
- Vamos bloquear outros protocolos;

---

## Máscaras Wildcard

> A wildcard mask is a mask of bits that indicates which parts of an IP address are available for examination. In the Cisco IOS, they are used in several places, for example:
> 
> - To indicate the size of a network or subnet for some routing protocols, such as OSPF.
> - To indicate what IP addresses should be permitted or denied in access control lists (ACLs).
> 
> A wildcard mask can be thought of as an inverted subnet mask. For example, a subnet mask of 255.255.255.0 (binary equivalent = `11111111.11111111.11111111.00000000`) inverts to a wildcard mask of `0.0.0.255` (binary equivalent = `00000000.00000000.00000000.11111111`).
>
> A wild card mask is a matching rule. The rule for a wildcard mask is:
>
> - `0` means that the equivalent bit must match
> - `1` means that the equivalent bit does not matter
>
> Any wildcard bit-pattern can be masked for examination. For example, a wildcard mask of `0.0.0.254` (binary equivalent = `00000000.00000000.00000000.11111110`) applied to IP address `10.10.10.2` (`00001010.00001010.00001010.00000010`) will match even-numbered IP addresses `10.10.10.0`, `10.10.10.2`, `10.10.10.4`, `10.10.10.6` etc. Same mask applied to `10.10.10.1` (`00001010.00001010.00001010.00000001`) will match odd-numbered IP addresses `10.10.10.1`, `10.10.10.3`, `10.10.10.5` etc. 