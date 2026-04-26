---
task: Lab Environment Setup
target: Metasploitable 2
network_segment: 172.20.0.0/24
status: DEPLOYED
---

# Lab Deployment: Metasploitable 2

> **Security Warning:** This container is intentionally vulnerable. 
> Deployment is restricted to an isolated Docker bridge to prevent lateral movement within the physical LAN.

## 01. Network Virtualization
Before spawning the target, a dedicated subnet was provisioned to sandbox all traffic between the auditor (Kali) and the victim.

```bash
# Provisioning a private subnet for pentesting ops
docker network create --subnet=172.20.0.0/24 pentest-net
