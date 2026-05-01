# Activity Logs

## Task 1: Log Analysis
**Command:** `grep "sqlmap" access.log`
**Evidence:** 
- `172.20.X.1 - - [26/Apr/2026] "GET /dvwa/vulnerabilities/sqli/..." 200`
- **User-Agent:** `sqlmap/1.10.4#stable`
- **Impact:** Clear identification of automated scanning tools via standard headers.

## Task 2: SIEM Simulation
**Command:** `python3 detect_sqli.py`
**Output:**
- ` SQLi detected from 172.20.X.1: union.*select`
- ` Suspicious tool from 172.20.X.1: sqlmap`
- ` Flood detected from 172.20.X.1: 134 requests`

## Task 3: Intrusion Prevention (Fail2ban)
- **Status:** Active (sshd jail)
- **Parameters:** `maxretry=5`, `findtime=10m`, `bantime=1h`.
- **Verification:** `sudo fail2ban-client status sshd` confirmed the jail is monitoring `/var/log/auth.log`.
