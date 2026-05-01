## SQLi Logic: The UNION Operator
The goal of `UNION` is to append our data to the application's legitimate output.
1.  We determine the number of columns in the original query.
2.  We craft a second query to pull sensitive data (passwords, emails).
3.  The browser displays our "injected" data as if it were part of the normal page.

## XSS Logic: Client-Side Execution
- **Reflected:** High interaction needed (social engineering).
- **Stored:** High impact (automatic infection of all visitors).

