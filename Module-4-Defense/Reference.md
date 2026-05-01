## 1. Log Analysis (SIEM Logic)
- **Apache Access Logs:** Recorded in Common Log Format (CLF).
  - Format: `IP - - [Date] "Request" Status_Code Size "User-Agent"`
- **Indicators of Compromise (IoC):**
  - **User-Agent:** Identifies the tool (e.g., `sqlmap`, `nmap`).
  - **Frequency:** High request volume in a short time (Flooding/Brute-force).
  - **Payload Patterns:** SQL keywords (`UNION`, `SELECT`, `SLEEP`) in URL parameters.

## 2. Web Application Firewall (WAF) Logic
A WAF acts as a filter between the internet and the web application. It uses **Signature-based detection**:
- If a request contains `1=1` OR `OR '1'='1'`, the WAF drops the packet.
- **Rate Limiting:** Blocks IPs that exceed a specific number of requests per second.

## 3. Intrusion Prevention: Fail2ban
Fail2ban is an IPS that scans log files and bans IPs that show malicious signs.
- **Jail:** A configuration combining a filter and an action for a specific service (e.g., SSH).
- **Filter:** Regular expressions (regex) used to find failed login attempts.
- **Action:** The command executed when a threshold is met (usually a firewall rule via `iptables` or `nftables`).
