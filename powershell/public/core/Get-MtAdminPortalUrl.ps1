﻿<#
    .SYNOPSIS
        Get the URL for the specific Microsoft admin portal based on the environment.

    .DESCRIPTION
        This function returns the URL for the specific Microsoft admin portal based on the environment.

    .EXAMPLE
        Get-MtAdminPortalUrl -Environment 'USGov' -Portal 'Azure'
        Returns the URL for the Azure portal in the Global environment.

    .LINK
        https://maester.dev/docs/commands/Get-MtAdminPortalUrl
#>

function Get-MtAdminPortalUrl {
    [CmdletBinding()]
    param(
        # The environment to use. If not specified, will use Global as default.
        [Parameter(Mandatory = $false)]
        [ValidateSet('Global', 'USGov', 'USGovDoD', 'Germany', 'China')]
        [string] $Environment = 'Global',

        # The portal to use. If not specified, returns all the portals.
        [Parameter(Mandatory = $false)]
        [ValidateSet('Azure', 'Entra', 'Intune', 'Purview', 'Security')]
        [string] $Portal
    )

    Write-Verbose -Message "Getting admin portal URL for environment: $Environment"

    if ([string]::IsNullOrEmpty($Environment) -or $Environment -eq 'Global') {
        $adminPortalUrl = @{
            Azure    = 'https://portal.azure.com/'
            Entra    = 'https://entra.microsoft.com/'
            Intune   = 'https://intune.microsoft.com/'
            Purview  = 'https://purview.microsoft.com/'
            Security = 'https://security.microsoft.com/'
        }
    } else {
        switch ($environment) {
            "China" {
                $adminPortalUrl = @{
                    Azure    = 'https://portal.azure.cn/'
                    Entra    = 'https://entra.microsoft.cn/'
                    Intune   = 'https://intune.microsoft.cn/'
                    Purview  = 'https://purview.microsoft.cn/'
                    Security = 'https://security.microsoft.cn/'
                }
            }
            "Germany" {
                $adminPortalUrl = @{
                    Azure    = 'https://portal.azure.de/'
                    Entra    = 'https://entra.microsoft.de/'
                    Intune   = 'https://intune.microsoft.de/'
                    Purview  = 'https://purview.microsoft.de/'
                    Security = 'https://security.microsoft.de/'
                }
            }
            { $_ -in "USGov", "USGovDoD" } {
                $adminPortalUrl = @{
                    Azure    = 'https://portal.azure.us/'
                    Entra    = 'https://entra.microsoft.us/'
                    Intune   = 'https://intune.microsoft.us/'
                    Purview  = 'https://purview.microsoft.us/'
                    Security = 'https://security.microsoft.us/'
                }
            }
        }
    }
    if ($Portal) {
        return $adminPortalUrl[$Portal]
    }
    return $adminPortalUrl
}