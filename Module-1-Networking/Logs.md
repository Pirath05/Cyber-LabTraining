# Module 1: Activity Logs (Sanitized)

## 1. Network Discovery
**Target Subnet:** `192.168.X.0/24` (Local Area Network)  
**Command:** `nmap -sn 192.168.X.0/24`

**Scan Results:**
- `192.168.X.1`   - [REDACTED] (Network Gateway / Router)
- `192.168.X.12`  - [REDACTED] (Target Workstation - Linux Mint)
- `192.168.X.27`  - [REDACTED] (Active Host - Silent/Stealth Mode)
- `192.168.X.42`  - [REDACTED] (Generic IoT/Media Device)

**Observations:**
- **Host Discovery:** Successfully mapped 4 active hosts using ARP requests on the local segment.
- **Stealth Host:** Host `.27` was visible via Layer 2 discovery (ARP) but remained unresponsive to Layer 4 probes (TCP/UDP), suggesting a strict host-based firewall configuration.

## 2. Host Audit & Fingerprinting
**Target:** `192.168.X.12` (Self-Audit)  
**Command:** `nmap -sV -Pn -T4 192.168.X.12`

**Technical Findings:**
| Port | Status | Service | Reason |
| :--- | :--- | :--- | :--- |
| 1-1000 | **Filtered** | Unknown | no-response |

**Analysis:**
- **Attack Surface:** All 1000 common TCP ports are reported as `filtered`.
- **Security Control:** The UFW (Uncomplicated Firewall) is operational with a `Default Deny (Incoming)` policy.
- **Packet Handling:** The firewall is configured to **DROP** packets rather than **REJECT** (ICMP Unreachable). This is a standard security hardening practice to slow down reconnaissance and obscure the host's actual state.
