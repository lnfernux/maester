<#
.SYNOPSIS
    Checks if Exchange Online Spam Policies are set to notify administrators

.DESCRIPTION
    Ensure Exchange Online Spam Policies are set to notify administrators
    CIS Microsoft 365 Foundations Benchmark v4.0.0

.EXAMPLE
    Test-MtCisOutboundSpamFilterPolicy

    Returns true if Exchange Online Spam Policies are set to notify administrators

.LINK
    https://maester.dev/docs/commands/Test-MtCisOutboundSpamFilterPolicy
#>
function Test-MtCisAuditDisabled {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (!(Test-MtConnection ExchangeOnline)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedExchange
        return $null
    }

    Write-Verbose "Getting Outbound Spam Filter Policy..."
    $policies = Get-MtExo -Request OrganizationConfig

    # Filter out the AuditDisabled property
    $policy = $policies | Format-List AuditDisabled

    #AuditDisabled should be False
    $AuditDisabled = @()
    $AuditDisabled += [pscustomobject] @{
        "CheckName" = "AuditDisabled"
        "Value"     = "False"
    }

    Write-Verbose "Executing checks"
    $failedCheckList = @()
    foreach ($check in $AuditDisabled) {

        $checkResult = $policy | Where-Object { $_.($check.CheckName) -notmatch $check.Value }

        if ($checkResult) {
            #If the check fails, add it to the list so we can report on it later
            $failedCheckList += $check.CheckName
        }

    }

    $testResult = ($failedCheckList | Measure-Object).Count -eq 0

    $portalLink = "https://learn.microsoft.com/en-us/purview/audit-mailboxes#verify-mailbox-auditing-on-by-default-is-turned-on"

    if ($testResult) {
        $testResultMarkdown = "Well done. Your tenant has auditing for mailboxes enabled.`n`n%TestResult%"
    }
    else {
        $testResultMarkdown = "Your tenant has AuditDisabled set to true for mailboxes.`n`n%TestResult%"
    }


    $resultMd = "| Check Name | Result |`n"
    $resultMd += "| --- | --- |`n"
    foreach ($item in $OutboundSpamFilterPolicyCheckList) {
        $itemResult = "❌ Fail"
        if ($item.CheckName -notin $failedCheckList) {
            $itemResult = "✅ Pass"
        }
        $resultMd += "| $($item.CheckName) | $($itemResult) |`n"
    }

    $testResultMarkdown = $testResultMarkdown -replace "%TestResult%", $resultMd

    Add-MtTestResultDetail -Result $testResultMarkdown

    return $testResult
}