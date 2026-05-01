# Module 3: Web Application Vulnerabilities

## 1. Web Reconnaissance Architecture
Web applications introduce a new layer of complexity: the interaction between the User (Browser), the Web Server (Apache), and the Database (MySQL).

## 2. SQL Injection (SQLi)
- **Root Cause:** Failure to sanitize user input before including it in a SQL query.
- **Mechanism:** Using characters like `'` to break the query string and injecting new SQL commands.
- **UNION-Based SQLi:** Leveraging the `UNION` operator to combine the results of the original query with a new, malicious query to extract data from other tables.

## 3. Cross-Site Scripting (XSS)
- **Reflected XSS:** The script is "reflected" off the web server (e.g., in an error message or search result). It is not stored; it requires the victim to click a specially crafted link.
- **Session Hijacking:** By using XSS to access `document.cookie`, an attacker can steal a user's **PHPSESSID**. This allows the attacker to impersonate the user without needing their password.

## 4. Automation vs. Manual Testing
- **Manual Testing:** Essential for understanding the logic and bypassing simple filters.
- **sqlmap:** An open-source penetration testing tool that automates the process of detecting and exploiting SQL injection flaws.
