## 1. Log Inspection
```bash
# Extracting logs from a container to the host
docker exec metasploitable cat /var/log/apache2/access.log > /tmp/access.log

# Searching for specific attack signatures
grep "sqlmap" /tmp/access.log
grep "UNION SELECT" /tmp/access.log
```

## 2. SIEM Simulation (Python Detection)
```bash
# Running the custom detection script
python3 ~/detect_sqli.py
```

## 3. Fail2ban Setup & Management
```bash
# 1. Installation
sudo apt install fail2ban -y

# 2. Configuration (Never edit jail.conf directly)
sudo nano /etc/fail2ban/jail.local

# 3. Service Control
sudo systemctl enable fail2ban
sudo systemctl restart fail2ban
sudo systemctl status fail2ban

# 4. Monitoring the Jail
sudo fail2ban-client status sshd
```

## 4. Manual Unbanning
```bash
sudo fail2ban-client set sshd unbanip [YOUR_IP]
```
