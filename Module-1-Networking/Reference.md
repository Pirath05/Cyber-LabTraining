# Module 1: Technical Reference

## Network Layers & Addressing
- **Layer 2 (Data Link):** Uses MAC Addresses for physical identification. ARP (Address Resolution Protocol) maps IP addresses to MAC addresses within a local subnet.
- **Layer 3 (Network):** Uses IP Addresses (IPv4/IPv6). 
- **Subnetting:** CIDR notation (e.g., `/24`) defines the network mask. A `/24` allows 254 usable host addresses.

## Protocols & Sockets
- **TCP (Transmission Control Protocol):** State-oriented. Relies on a 3-way handshake (SYN -> SYN-ACK -> ACK) to establish a connection.
- **UDP (User Datagram Protocol):** Stateless and connectionless. No delivery guarantee.
- **Ports:** 65,535 available ports. Ports 1-1023 are "well-known" (e.g., 22 for SSH, 80 for HTTP).



## Filtering Logic
- **Ingress Filtering:** Rules governing incoming traffic (controlled via UFW/Iptables).
- **Egress Filtering:** Rules governing outgoing traffic.
- **Stateful Inspection:** The firewall's ability to track the state of active connections and automatically allow return traffic.
