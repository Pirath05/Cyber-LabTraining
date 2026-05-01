import re
from collections import defaultdict

LOG_FILE = "/tmp/access.log"

SQLI_PATTERNS = [
    r"union.*select",
    r"sleep\(",
    r"information_schema",
    r"order\s+by",
    r"extractvalue",
    r"--\s*-",
    r"1=1",
    r"or\s+'1'='1",
]

BAD_AGENTS = ["sqlmap", "nikto", "nmap", "masscan"]

def analyze_log(filepath):
    ip_requests = defaultdict(int)
    alerts = []
    
    try:
        with open(filepath, 'r') as f:
            for line in f:
                ip = line.split()[0]
                ip_requests[ip] += 1
                line_lower = line.lower()

                for pattern in SQLI_PATTERNS:
                    if re.search(pattern, line_lower):
                        alerts.append(f" SQLi detected from {ip}: {pattern}") # c'est quoi ct merde encore
                        break
                
                for agent in BAD_AGENTS:
                    if agent in line_lower:
                        alerts.append(f" Suspicious tool from {ip}: {agent}")
                        break
    except FileNotFoundError:
        print("Log file not found. Run the export command first.")
        return

    # Flood detection (> 20 requests)
    for ip, count in ip_requests.items():
        if count > 20:
            alerts.append(f" Flood detected from {ip}: {count} requests")

    print("=== DETECTION REPORT ===\n")
    for alert in sorted(list(set(alerts))):
        print(alert)

if __name__ == "__main__":
    analyze_log(LOG_FILE)
