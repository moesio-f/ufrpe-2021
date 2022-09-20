> Como referência desse material, irei utilizar as RFCs presentes no site do [IETF](https://www.ietf.org/standards/rfcs/).
> 
> *RFCs produced by the IETF cover many aspects of computer networking. They describe the Internet's technical foundations, such as addressing, routing, and transport technologies. RFCs also specify protocols like TLS 1.3, QUIC, and WebRTC that are used to deliver services used by billions of people every day, such as real-time collaboration, email, and the domain name system.*
> 
> *Only some RFCs are standards. Depending on their maturity level and what they cover, RFCs are labeled with different statuses: Internet Standard, Proposed Standard, Best Current Practice, Experimental, Informational, and Historic.*
> 
> *The RFC Series includes documents produced by the IETF, the Internet Architecture Board (IAB), the Internet Research Task Force (IRTF), and independent submitters. All RFCs are published by the [RFC Editor](https://www.rfc-editor.org/), which is the authoritative source for retrieving RFCs.*

# Glossário

Algumas definições importantes:

- **Autonomous System (AS)**: um sistema autônomo é uma coleção de redes (ou uma única rede grande) que possuem uma política de roteamento pré-definida.
 - *An AS routing policy is a list of the IP address space that the AS controls, plus a list of the other ASes to which it connects. This information is necessary for routing packets to the correct networks.* (https://www.cloudflare.com/learning/network-layer/what-is-an-autonomous-system/)
- **Interior gateway protocol (IGP)**: protocolo de roteamento para troca de informações (*tabelas de roteamento*) dentro de um mesmo AS.
 - Alguns exemplos: OSPF, RIP, IGRP.
- **Exterior gateway protocol (EGP)**: protocolo de roteamento utilizada para troca de informações de roteamento entre ASes.
 - Exemplo: EGP e BGP.
- **Serial Port**: interface de comunicação onde bits são transferidos sequencialmente (1 bit por vez).
 - Interfaces Ethernet utilizam conexões seriais.
 - Outras interfaces seriais são utilizadas para configuração de roteadores.
- **Routing Information Base (RIB)**: Contém as redes conhecidas, seu endereço (prefixo), e o próximo roteador que consegue chegar a essa rede (next hop).
- **Forwarding Information Base (FIB)**: Apenas as melhores rotas são gravadas, além de armazenar as interfaces que devem receber esse pacote.


# RFC 2328 (STD 54): [OSPF Version 2](https://www.rfc-editor.org/rfc/inline-errata/rfc2328.html)

Nessa seção, quando falarmos em OSPF estamos nos referindo à versão 2.

> *This memo documents version 2 of the OSPF protocol. OSPF is a link-state routing protocol. It is designed to be run internal to a single Autonomous System. Each OSPF router maintains an identical database describing the Autonomous System's topology. From this database, a routing table is calculated by constructing a shortest-path tree.*
> 
> *OSPF recalculates routes quickly in the face of topological changes, utilizing a minimum of routing protocol traffic. In addition, all OSPF routing protocol exchanges are authenticated.*

- OSPF é um protocolo IGP baseado no *link-state* ou tecnologia SPF (Sender Policy Framework). 
- O OSPF roteia pacotes/datagramas IP baseando-se apenas no endereço de IP destino presente no cabeçalho.
- Os datagramas IP são roteados como recebidos (i.e., sem nenhum tipo de encapsulação extra).
- OSPF é um protocolo de roteamento dinâmico, capaz de detectar mudanças na topologia do AS e definir uma nova rota (loop-free);
- O OSPF determina um custo de um caminho baseado em diferentes fatores (e.g., velocidade, congestionamento, etc).

> *In a link-state routing protocol, each router maintains a database describing the Autonomous System's topology. This database is referred to as the link-state database. Each participating router has an identical database. Each individual piece of this database is a particular router's local state (e.g., the router's usable interfaces and reachable neighbors). The router distributes its local state throughout the Autonomous System by flooding.*
> 
> *All routers run the exact same algorithm, in parallel. From the link-state database, each router constructs a tree of shortest paths with itself as root. This shortest-path tree gives the route to each destination in the Autonomous System. Externally derived routing information appears on the tree as leaves.*
> 
> *When several equal-cost routes to a destination exist, traffic is distributed equally among them.  The cost of a route is described by a single dimensionless metric.*

- Permite que conjuntos de redes sejam agrupadas (*area*);
  - A topologia de cada área é escondida do restante do AS;
  - Uma área é uma generalização das sub-redes IP;
- Toda rota disponibilizada pelo OSPF possui um destino e máscara, duas sub-redes distintas podem possuir máscaras diferentes (VLSM);
  - Pacotes são roteados para o melhor destino (i.e., maior match ou mais específico);
- Todas as trocas do OSPF são autenticadas, apenas roteadores confiáveis podem participar do roteamento dentro do AS;
- O OSPF se comunica através de datagramas IP;

> *Externally derived routing data (e.g., routes learned from an Exterior Gateway Protocol such as BGP; see [Ref23]) is advertised throughout the Autonomous System. This externally derived data is kept separate from the OSPF protocol's link state data.  Each external route can also be tagged by the advertising router, enabling the passing of additional information between routers on the boundary of the Autonomous System.*


# RFC 2453 (STD 56): [RIP Version 2](https://www.rfc-editor.org/rfc/rfc2453.html)

> *This document specifies an extension of the Routing Information Protocol (RIP), as defined in [[1]](https://www.rfc-editor.org/rfc/rfc1058), to expand the amount of useful information carried in RIP messages and to add a measure of security.*
> 
> *With the advent of OSPF and IS-IS, there are those who believe that RIP is obsolete.  While it is true that the newer IGP routing protocols are far superior to RIP, RIP does have some advantages. Primarily, in a small network, RIP has very little overhead in terms of bandwidth used and configuration and management time.  RIP is also very easy to implement, especially in relation to the newer IGPs.*
> 
> *The current RIP-1 protocol does not consider autonomous systems and IGP/EGP interactions, subnetting [[11]](https://www.rfc-editor.org/rfc/rfc1812), and authentication since implementations of these postdate RIP-1.*

- O RIP é um protocolo baseado no algoritmo de Bellman-Ford (*distance vector*);
- O RIP foi desenvolvido para ser usado em AS's de tamanho moderado;
- O RIP é um protocolo *Distance Vector*, onde os roteadores trocam uma pequena quantidade de informações;
- O RIP usa uma métrica inteira com valores em [1..15], normalmente usado o hop-count;
- O RIP se comunica através de UDP (Camada de Transporte);

# Diferenças entre OSPF e RIP

https://www.geeksforgeeks.org/difference-between-rip-and-ospf/

| **RIP** | **OSPF** |
| --- | --- |
|	RIP Stands for Routing Information Protocol. | OSPF stands for Open Shortest Path First.
| RIP works on the Bellman-Ford algorithm. | OSPF works on Dijkstra algorithm.
| It is a Distance Vector protocol and it uses the distance or hops count to determine the transmission path.	| It is a link-state protocol and it analyzes different sources like the speed, cost and path congestion while identifying the shortest path.
|	It is used for smaller size organizations. | It is used for larger size organizations in the network.
|	It allows a maximum of 15 hops. |	There is no such restriction on the hop count.
|	It is not a more intelligent dynamic routing protocol. | It is a more intelligent routing protocol than RIP.
|	The networks are classified as areas and tables here.	| The networks are classified as areas, sub-areas, autonomous systems, and backbone areas here.
|	Its administrative distance is 120.	| Its administrative distance is 110.
|	RIP uses UDP(User Datagram Protocol) Protocol. | OSPF works for IP(Internet Protocol) Protocol.
| It calculates the metric in terms of Hop Count.	| It calculates the metric in terms of bandwidth.
|	In RIP, the whole routing table is to be broadcasted to the neighbors every 30 seconds by the routers. | In OSPF, parts of the routing table are only sent when a change has been made to it.
| RIP utilizes less memory compared to OSPF but is CPU intensive like OSPF. |	OSPF device resource requirements are CPU intensive and memory.
| It consumes more bandwidth because of greater network resource requirements in sending the whole routing table.	| It consumes less bandwidth as only part of the routing table is to send.
|	Its multicast address is 224.0.0.9.	| OSPF’s multicast addresses are 224.0.0.5 and 224.0.0.6. 