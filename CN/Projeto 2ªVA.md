- [Projeto 2ªVA](#projeto-2ªva)
  - [1. Roteamento: OSPF vs RIP?](#1-roteamento-ospf-vs-rip)
    - [Configuração para o C7200](#configuração-para-o-c7200)

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

### Configuração para o C7200

> Referências:
> - https://www.cisco.com/c/en/us/support/docs/ip/open-shortest-path-first-ospf/7039-1.html
> - https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/iproute_ospf/configuration/xe-16/iro-xe-16-book/iro-cfg.html
> - https://www.dltec.com.br/blog/cisco/configurando-o-ospf-single-area-para-ccnas/

- Quais áreas devemos possuir?