
## 1. Mapping
| **SQL Injection** | SQL keywords in GET/POST logs | WAF + Prepared Queries |

| **Directory Brute-force** | High frequency of 404 errors | Rate Limiting + Fail2ban |

| **SSH Brute-force** | "Failed password" in auth.log | Fail2ban + Public Key Auth |

| **Nmap Scan** | Rapid TCP SYN on multiple ports | IDS (Snort) + Firewall |

## 2. Fail2ban Logic
1. **`findtime`**: The observation window. (e.g., Look at the last 10 minutes).
2. **`maxretry`**: The tolerance level. (e.g., Allow 5 mistakes).
3. **`bantime`**: The punishment duration. (e.g., Block for 1 hour).

**Strategy:** A low `maxretry` with a high `bantime` is effective against bots but risks locking out legitimate users.

## 3. Operational Security (OPSEC) for Defenders
- **Log Rotation:** Ensure logs are archived so they don't fill the disk (potential DoS).
- **Centralization:** In a real environment, logs are sent to a remote server so an attacker cannot delete them after gaining root access.
- **Alerting:** Detection is useless without notification.
