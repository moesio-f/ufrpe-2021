- [Projeto 2ªVA](#projeto-2ªva)
  - [1. Roteamento: OSPF vs RIP?](#1-roteamento-ospf-vs-rip)
    - [Configuração do OSPF para o C7200](#configuração-do-ospf-para-o-c7200)
    - [Configuração do Firewall para o C7200](#configuração-do-firewall-para-o-c7200)
  - [Máscaras Wildcard](#máscaras-wildcard)

---
# Projeto 2ªVA

## 1. Roteamento: OSPF vs RIP?

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

- **Quais áreas devemos possuir?** Precisamos apenas de de backbone, visto que nossa topologia é extremamente simples.

### Configuração do Firewall para o C7200

- Vamos bloquear ICMPs;
- Vamos bloquear alguns hosts;
- Vamos bloquear outros protocolos;

---

## Máscaras Wildcard

> A wildcard mask is a mask of bits that indicates which parts of an IP address are available for examination. In the Cisco IOS, they are used in several places, for example:
> 
> To indicate the size of a network or subnet for some routing protocols, such as OSPF.
> 
> To indicate what IP addresses should be permitted or denied in access control lists (ACLs).
> 
> A wildcard mask can be thought of as an inverted subnet mask. For example, a subnet mask of 255.255.255.0 (binary equivalent = `11111111.11111111.11111111.00000000`) inverts to a wildcard mask of `0.0.0.255` (binary equivalent = `00000000.00000000.00000000.11111111`).
>
> A wild card mask is a matching rule. The rule for a wildcard mask is:
>
> - `0` means that the equivalent bit must match
> - `1` means that the equivalent bit does not matter
>
> Any wildcard bit-pattern can be masked for examination. For example, a wildcard mask of `0.0.0.254` (binary equivalent = `00000000.00000000.00000000.11111110`) applied to IP address `10.10.10.2` (`00001010.00001010.00001010.00000010`) will match even-numbered IP addresses `10.10.10.0`, `10.10.10.2`, `10.10.10.4`, `10.10.10.6` etc. Same mask applied to `10.10.10.1` (`00001010.00001010.00001010.00000001`) will match odd-numbered IP addresses `10.10.10.1`, `10.10.10.3`, `10.10.10.5` etc. 