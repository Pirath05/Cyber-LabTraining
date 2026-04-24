# Module 1: Technical Commands

## Local Audit
- `ip a`: Displays all network interfaces, status (UP/DOWN), and assigned IP/MAC addresses.
- `ip route`: Displays the kernel's routing table and the default gateway.
- `ss -tulnp`: Lists listening sockets. 
    - `-t/-u`: TCP/UDP.
    - `-l`: Listening state.
    - `-n`: Numeric ports (no DNS).
    - `-p`: Process identification.

## Reconnaissance (Nmap)


- `nmap -sn [network/prefix]`: Performs a Ping Scan. Uses ARP requests on local subnets to identify live hosts.
- `nmap -Pn [target]`: Skips host discovery. Assumes the target is up (bypasses ICMP blocks).
- `nmap -sV [target]`: Service version detection. Interrogates open ports to determine service software and version.
- `nmap -T4 [target]`: Aggressive timing template for faster execution.

## DNS & Firewall
- `dig [domain] +short`: Queries DNS A-records for IPv4 mapping.
- `sudo ufw status verbose`: Reports the current state of the netfilter firewall and default policies (Deny/Allow).
