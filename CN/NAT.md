> https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/ipaddr_nat/configuration/15-mt/nat-15-mt-book/iadnat-addr-consv.html
> 
> https://www.cisco.com/c/en/us/support/docs/ip/network-address-translation-nat/13770-1.html
> 
> https://www.cisco.com/c/en/us/support/docs/ip/network-address-translation-nat/13772-12.html
> 
> https://www.firewall.cx/cisco-technical-knowledgebase/cisco-routers/260-cisco-router-nat-overload.html


> *The term inside in a Network Address Translation (NAT) context refers to networks owned by an organization that must be translated. When NAT is configured, hosts within this network have addresses in one space (known as the **local address space**). These hosts appear to those users outside the network as being in another space (known as the **global address space**).*
> 
> Similarly, the term outside refers to those networks to which the stub network connects, and which are not under the control of an organization. Also, hosts in outside networks can be subject to translation, and can thus have local and global addresses. NAT uses the following definitions:
> 
> - **Inside local address**: An IP address that is assigned to a host on the inside network.
> - **Inside global address**: A legitimate IP address assigned by the NIC or service provider that represents one or more inside local IP addresses to the outside world.
> - **Outside local address**: The IP address of an outside host as it appears to the inside network. Not necessarily a legitimate address, it is allocated from the address space that is routable on the inside.
> - **Outside global address**: The IP address that is assigned to a host on the outside network by the owner of the host. The address is allocated from a globally routable address or network space.


> You can translate IP addresses into globally unique IP addresses when communicating outside of your network. You can configure inside source address translation of static or dynamic NAT as follows:
> - **Static translation** establishes a one-to-one mapping between the inside local address and an inside global address. Static translation is useful when a host on the inside must be accessible by a fixed address from the outside.
> - **Dynamic translation** establishes a mapping between an inside local address and a pool of global addresses.
> 
> *You can conserve addresses in the inside global address pool by allowing a device to use one global address for many local addresses. This type of Network Address Translation (NAT) configuration is called overloading. When overloading is configured, the device maintains enough information from higher-level protocols (for example, TCP or UDP port numbers). This action translates the global address back to the correct local address. When multiple local addresses map to one global address, the TCP or UDP port numbers of each inside host distinguish between local addresses.*