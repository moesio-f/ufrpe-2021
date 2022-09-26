- [Vídeo-aulas Complementares](#vídeo-aulas-complementares)
- [Introduction to DNS and BIND 9](#introduction-to-dns-and-bind-9)
- [RFC 1035 (STD 13): Domain names - implementation and specification](#rfc-1035-std-13-domain-names---implementation-and-specification)

---

# Vídeo-aulas Complementares

- Domain Name System: mapeamento de nomes para IPs;
  - Para funcionar bem, utilizamos um sistema distribuído e hierárquico.
- *Resolver* -> *Recursivo*:
  - O recursivo vai procurar no servidor raiz;
  - O raiz responder com um outro servidor autoritativo que pode conhecer a resposta;
  - Esse processo continua até encontrar o servidor autoritativo do domínio final.

- `hosts.txt` como início do DNS;
- Com o tempo, se mostrou inviável, sendo necessário distribuir e escalar;
  - Podemos separar em uma forma de árvore;
  - Em cada nó, temos **arquivos de zona** (definindo os IPs);
    - Cada arquivo é formado por: (i) Versão do arquivo; (ii) Mapeamento nome IP; (iii) Mapeamento IP nome; (iv) Endereço do servidor DNS; (v) Endereço de servidor e-mai; (vi) outros.
    - É necessário adicionar *glue records* (IPs para servidores DNS);
  - Para obter agora um IP agora, precisamos iniciar da raiz e ir descendo nos filhos;
- Todavia, ainda é necessário garantir que em caso de falha de uma máquina o sistema continue funcionando: adicionar múltiplos servidores alternativos utilizando um padrão Master-Slave;
- Além disso, a raiz (e outros servidores DNS de alto nível) vão receber muitas solicitações, assim: utilizamos um servidor DNS intermediário com um sistema de cache.
  - Tal servidor é chamado de *recursivo*;
- DNS Reverso: utiliza o record *PTR* para mapear IPs para nomes.
  - **in-addr.arpa.**: domínio para armazenar endereços IPv4


# [Introduction to DNS and BIND 9](https://bind9.readthedocs.io/en/v9_18_7/chapter1.html)

> *The Internet Domain Name System (DNS) consists of:*
>
> - *the syntax to specify the names of entities in the Internet in a hierarchical manner*
> - *the rules used for delegating authority over names*
> - *the system implementation that actually maps names to Internet addresses.*
> 
> *DNS data is maintained in a group of distributed hierarchical databases.*

> *The Berkeley Internet Name Domain (BIND) software implements a domain name server for a number of operating systems.*

> *All network systems operate with network addresses, such as IPv4 and IPv6. The vast majority of humans find it easier to work with names rather than seemingly endless strings of network address digits.*

> *The DNS naming system is organized as a tree structure comprised of multiple levels and thus it naturally creates a distributed system. Each node in the tree is given a label which defines its Domain (its area or zone) of Authority. The topmost node in the tree is the Root Domain; it delegates to Domains at the next level which are generically known as the Top-Level Domains (TLDs). They in turn delegate to Second-Level Domains (SLDs), and so on. The Top-Level Domains (TLDs) include a special group of TLDs called the Country Code Top-Level Domains (ccTLDs).*

![IMG](https://bind9.readthedocs.io/en/v9_18_7/_images/dns-tree.png)

> *A domain is the label of a node in the tree. A domain name uniquely identifies any node in the DNS tree and is written, left to right, by combining all the domain labels (each of which are unique within their parent’s zone or domain of authority), with a dot separating each component, up to the root domain.*
> 
> *The root has a unique label of “.” (dot), which is normally omitted when it is written as a domain name, but when it is written as a Fully Qualified Domain Name (FQDN) the dot must be present.*

> *Each domain (node) has been delegated the authority from its parent domain. The delegated authority includes specific responsibilities to ensure that every domain it delegates has a unique name or label within its zone or domain of authority, and that it maintains an authoritative list of its delegated domains.*

> *The process of converting a domain name to a result (typically an IP address, though other types of data may be obtained) is generically called name resolution, and is handled by resolvers (also known as caching name servers and many other terms).*

![IMG](https://bind9.readthedocs.io/en/v9_18_7/_images/name-resolution.png)

> *DNS queries use the UDP protocol over the reserved port 53 (but both TCP and TLS can optionally be used in some parts of the network).*
 
> *BIND 9 is a complete implementation of the DNS protocol. BIND 9 can be configured (using its `named.conf` file) as an authoritative name server, a resolver, and, on supported hosts, a stub resolver.*


# RFC 1035 (STD 13): [Domain names - implementation and specification](https://www.rfc-editor.org/info/rfc1035)