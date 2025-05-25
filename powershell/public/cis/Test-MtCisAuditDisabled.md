6.1.1 (L1) Ensure 'AuditDisabled' organizationally is set to 'False'

**Rationale:**
The value False indicates that mailbox auditing on by default is turned on for the organization. Mailbox auditing on by default in the organization overrides the mailbox auditing settings on individual mailboxes. For example, if mailbox auditing is turned off for a mailbox (the AuditEnabled property on the mailbox is False), the default mailbox actions are still audited for the mailbox, because mailbox auditing on by default is turned on for the organization.

#### Remediation action:

To enable auditing for mailboxes if turned off:
1. Connect to Exchange Online via Powershell

    ```pwsh
    Import-Module ExchangeOnlineManagement
    Connect-ExchangeOnline -UserPrincipalName "admin@domain.com"
    ```
2. Set `AuditDisabled` to `$false`

    ```pwsh
    Set-OrganizationConfig -AuditDisabled $false
    ```
#### Related links

* [Microsoft 365 Defender](https://security.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v4.0.0 - Page 129](https://www.cisecurity.org/benchmark/microsoft_365)

<!--- Results --->
%TestResult%