# Camada de Redes

## Endereçamento IP

- Uma das principais características é o endereçamento lógico: identificação de redes e *hosts*.
- Para o IPv4, utilizamos 32-bits para representação dos endereços.
  - Representamos endereços IP utilizando a notação `A.B.C.D`,
  - Inicialmente, eram utilizadas classes para definir como diferenciar *hosts* de *redes*. Cada uma dessas classes reservavam uma quantidade bits iniciais e definia a quantidade de bits que deveriam ser utilizadas para identificação das redes e hosts.
    - Classe A: `Rede.Host.Host.Host`
      - 126 redes possíveis, com 16.8Mi hosts;
    - Classe B: `Rede.Rede.Host.Host`
      - 16K redes, 65.5K hosts;
    - Classe C: `Rede.Rede.Rede.Host`
      - 2M redes, 256 hosts;
- Existem endereços especiais:
  - Endereços onde hosts tem todos os bits em `0` representam uma rede.
  - Endereços onde hosts tem todos bits `1` representam *broadcast*.
  - A rede `127.0.0.1` é reservada para loopback.
- Como funciona o encaminhamento de datagramas?
  - Cada pacote tem um endereço de destino
  - Se já estamos na rede destino, encaminhar diretamente para o *host* (Tabela ARP)
  - Se não estamos, encaminhar para algum *roteador*.
  - Todo *host* possui um *default gateway* (endereço do roteador padrão).
  - O *roteador* tem responsabilidade de manter uma tabela de encaminhamento e deve enviar essa informação para a próxima rede.
- Algoritmo simples de encaminhamento de datagramas:

> 1. Se, `endereço destino` == `endereço transmissor`: *loopback*
> 2. Se, `rede destino` == `rede atual`: ARP
> 3. Se `rede destino` != `rede atual`: enviar para *gateway* (ARP + MAC) endereçado para o endereço destino.

## Sub-rede IP

- Existem diferentes motivos para a criação de sub-redes, a solução para isso é utilizar os bits de *host* para divisão em sub-redes.
- Sub-redes só são visíveis dentro da rede atual.
- Usamos uma **máscara de sub-rede** para definição da *sub-rede* e *hosts*.
- Quando usamos sub-redes, não utilizamos as **máscaras de rede padrão**.
- De forma análogo, temos alguns endereços reservados para sub-redes:
  - Quando o valor do *host* é `0`, essa é a identificação da rede;
  - O último endereço da sub-rede é o *broadcast*.
  - Uma possibilidade para evitar ambiguidade (e.g., endereços reservados da própria rede aparecendo como endereços reservados de sub-redes) é limitar o espaço endereçável de sub-redes.

## ICMP

- Protocolo que permite o uso *feedbacks* para ambientes de comunicação onde o IP não é confiável.
- Uma mensagem ICMP é enviada dentro do cabeçalho de um datagrama IP.
- Os erros são detectados em:
  - Roteador (e.g., endereço inalcançável, descarte por necessitar fragmentação, tempo excedido)
  - Host (e.g., protocolo não ativo, porta não configurada, remontagem e tempo excedido)

---

OBS:.

> A principal tarefa da camada de *enlace* é fazer com que o meio de transmissão seja transparente para a camada de *rede* (i.e., não precisa se preocupar com o meio físico).