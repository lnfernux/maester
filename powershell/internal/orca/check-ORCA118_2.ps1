# Generated on 04/16/2025 21:38:23 by .\build\orca\Update-OrcaTests.ps1

using module ".\orcaClass.psm1"

[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingEmptyCatchBlock', '')]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSPossibleIncorrectComparisonWithNull', '')]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingCmdletAliases', '')]
param()




class ORCA118_2 : ORCACheck
{
    <#
    
        CONSTRUCTOR with Check Header Data
    
    #>

    ORCA118_2()
    {
        $this.Control="118-2"
        $this.Area="Transport Rules"
        $this.Name="Domain Allow Listing"
        $this.PassText="Domains are not being allow listed in an unsafe manner"
        $this.FailRecommendation="Remove allow listed domains"
        $this.Importance="Emails coming from allow listed domains bypass several layers of protection within Exchange Online Protection. If domains are allow listed, they are open to being spoofed from malicious actors."
        $this.ExpandResults=$True
        $this.CheckType=[CheckType]::ObjectPropertyValue
        $this.ObjectType="Transport Rule"
        $this.ItemName="Condition"
        $this.DataType="Allow Listed Address"
        $this.ChiValue=[ORCACHI]::High
        $this.Links= @{
            "Exchange admin center in Exchange Online"="https://outlook.office365.com/ecp/"
            "Using Exchange Transport Rules (ETRs) to allow specific senders"="https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/create-safe-sender-lists-in-office-365#using-exchange-transport-rules-etrs-to-allow-specific-senders-recommended"
        }
    }

    <#
    
        RESULTS
    
    #>

    GetResults($Config)
    {
        $Check = "Transport Rule SCL"
    
        # Look through Transport Rule for an action SetSCL -1
    
        ForEach($TransportRule in $Config["TransportRules"]) 
        {
            If($TransportRule.SetSCL -eq "-1") 
            {
                #Rules that apply to the sender domain
                #From Address notmatch is to include if just domain name is value
                If($TransportRule.SenderDomainIs -ne $null -or ($TransportRule.FromAddressContainsWords -ne $null -and $TransportRule.FromAddressContainsWords -notmatch ".+@") -or ($TransportRule.FromAddressMatchesPatterns -ne $null -and $TransportRule.FromAddressMatchesPatterns -notmatch ".+@"))
                {
                    #Look for condition that checks auth results header and its value
                    If(($TransportRule.HeaderContainsMessageHeader -eq 'Authentication-Results' -and $TransportRule.HeaderContainsWords -ne $null) -or ($TransportRule.HeaderMatchesMessageHeader -like '*Authentication-Results*' -and $TransportRule.HeaderMatchesPatterns -ne $null)) 
                    {
                        # OK
                    }
                    #Look for exception that checks auth results header and its value 
                    elseif(($TransportRule.ExceptIfHeaderContainsMessageHeader -eq 'Authentication-Results' -and $TransportRule.ExceptIfHeaderContainsWords -ne $null) -or ($TransportRule.ExceptIfHeaderMatchesMessageHeader -like '*Authentication-Results*' -and $TransportRule.ExceptIfHeaderMatchesPatterns -ne $null)) 
                    {
                        # OK
                    }
                    elseif($TransportRule.SenderIpRanges -ne $null) 
                    {
                        # OK
                    }
                    #Look for condition that checks for any other header and its value
                    else 
                    {

                        ForEach($RuleDomain in $($TransportRule.SenderDomainIs)) 
                        {

                            # Check objects
                            $ConfigObject = [ORCACheckConfig]::new()
                            $ConfigObject.Object=$($TransportRule.Name)
                            $ConfigObject.ConfigItem="From Domain"
                            $ConfigObject.ConfigData=$($RuleDomain)
                            $ConfigObject.ConfigDisabled=$($TransportRule.State -ne "Enabled")

                            $ConfigObject.SetResult([ORCAConfigLevel]::Standard,"Fail")

                            $this.AddConfig($ConfigObject)  

                        }
                        ForEach($FromAddressContains in $($TransportRule.FromAddressContainsWords)) 
                        {

                            # Check objects
                            $ConfigObject = [ORCACheckConfig]::new()
                            $ConfigObject.Object=$($TransportRule.Name)
                            $ConfigObject.ConfigItem="From Contains"
                            $ConfigObject."$($FromAddressContains)"
                            $ConfigObject.ConfigDisabled=$($TransportRule.State -ne "Enabled")

                            $ConfigObject.SetResult([ORCAConfigLevel]::Standard,"Fail")

                            $this.AddConfig($ConfigObject)  

                        }
                        ForEach($FromAddressMatch in $($TransportRule.FromAddressMatchesPatterns)) 
                        {

                            # Check objects
                            $ConfigObject = [ORCACheckConfig]::new()
                            $ConfigObject.Object=$($TransportRule.Name)
                            $ConfigObject.ConfigItem="From Matches"
                            $ConfigObject."$($FromAddressMatch)"
                            $ConfigObject.ConfigDisabled=$($TransportRule.State -ne "Enabled")

                            $ConfigObject.SetResult([ORCAConfigLevel]::Standard,"Fail")
                            
                            $this.AddConfig($ConfigObject) 

                        }
    
                    }
                }
                #No sender domain restriction, so check for IP restriction
                elseif($null -ne $TransportRule.SenderIpRanges) 
                {
                    ForEach($SenderIpRange in $TransportRule.SenderIpRanges) 
                    {
                        # Check objects
                        $ConfigObject = [ORCACheckConfig]::new()
                        $ConfigObject.Object=$($TransportRule.Name)
                        $ConfigObject.ConfigItem="IP Range"
                        $ConfigObject.ConfigData=$SenderIpRange
                        $ConfigObject.ConfigDisabled=$($TransportRule.State -ne "Enabled")

                        $ConfigObject.SetResult([ORCAConfigLevel]::Standard,"Fail")
                        
                        $this.AddConfig($ConfigObject) 
                    }
                }
                #No sender restriction, so check for condition that checks auth results header and its value
                elseif(($TransportRule.HeaderContainsMessageHeader -eq 'Authentication-Results' -and $TransportRule.HeaderContainsWords -ne $null) -or ($TransportRule.HeaderMatchesMessageHeader -like '*Authentication-Results*' -and $TransportRule.HeaderMatchesPatterns -ne $null)) 
                {
                    # OK
                }
                #No sender restriction, so check for exception that checks auth results header and its value 
                elseif(($TransportRule.ExceptIfHeaderContainsMessageHeader -eq 'Authentication-Results' -and $TransportRule.ExceptIfHeaderContainsWords -ne $null) -or ($TransportRule.ExceptIfHeaderMatchesMessageHeader -like '*Authentication-Results*' -and $TransportRule.ExceptIfHeaderMatchesPatterns -ne $null)) 
                {
                    # OK
                }
            }
        }    

    }

}
