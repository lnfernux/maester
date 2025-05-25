Describe "Maester/Entra" -Tag "Maester", "CA", "Security", "All" {
    It "MT.1001: At least one Conditional Access policy is configured with device compliance. See https://maester.dev/docs/tests/MT.1001" -Tag "MT.1001" {
        Test-MtCaDeviceComplianceExists | Should -Be $true -Because "there is no policy which requires device compliances"
    }
    It "MT.1003: At least one Conditional Access policy is configured with All Apps. See https://maester.dev/docs/tests/MT.1003" -Tag "MT.1003" {
        Test-MtCaAllAppsExists -SkipCheckAllUsers | Should -Be $true -Because "there is no policy scoped to All Apps"
    }
    It "MT.1004: At least one Conditional Access policy is configured with All Apps and All Users. See https://maester.dev/docs/tests/MT.1004" -Tag "MT.1004" {
        Test-MtCaAllAppsExists | Should -Be $true -Because "there is no policy scoped to All Apps and All Users"
    }
    It "MT.1005: All Conditional Access policies are configured to exclude at least one emergency/break glass account or group. See https://maester.dev/docs/tests/MT.1005" -Tag "MT.1005" {
        Test-MtCaEmergencyAccessExists | Should -Be $true -Because "there is no emergency access account or group present in all enabled policies"
    }
    It "MT.1006: At least one Conditional Access policy is configured to require MFA for admins. See https://maester.dev/docs/tests/MT.1006" -Tag "MT.1006" {
        Test-MtCaMfaForAdmin | Should -Be $true -Because "there is no policy that requires MFA for admins"
    }
    It "MT.1007: At least one Conditional Access policy is configured to require MFA for all users. See https://maester.dev/docs/tests/MT.1007" -Tag "MT.1007" {
        Test-MtCaMfaForAllUsers | Should -Be $true -Because "there is no policy that requires MFA for all users"
    }
    It "MT.1008: At least one Conditional Access policy is configured to require MFA for Azure management. See https://maester.dev/docs/tests/MT.1008" -Tag "MT.1008" {
        Test-MtCaMfaForAdminManagement | Should -Be $true -Because "there is no policy that requires MFA for Azure management"
    }
    It "MT.1009: At least one Conditional Access policy is configured to block other legacy authentication. See https://maester.dev/docs/tests/MT.1009" -Tag "MT.1009" {
        Test-MtCaBlockLegacyOtherAuthentication | Should -Be $true -Because "there is no policy that blocks legacy authentication"
    }
    It "MT.1010: At least one Conditional Access policy is configured to block legacy authentication for Exchange ActiveSync. See https://maester.dev/docs/tests/MT.1010" -Tag "MT.1010" {
        Test-MtCaBlockLegacyExchangeActiveSyncAuthentication | Should -Be $true -Because "there is no policy that blocks legacy authentication for Exchange ActiveSync"
    }
    It "MT.1011: At least one Conditional Access policy is configured to secure security info registration only from a trusted location. See https://maester.dev/docs/tests/MT.1011" -Tag "MT.1011" {
        Test-MtCaSecureSecurityInfoRegistration | Should -Be $true -Because "there is no policy that secures security info registration"
    }
    It "MT.1012: At least one Conditional Access policy is configured to require MFA for risky sign-ins. See https://maester.dev/docs/tests/MT.1012" -Skip:( $EntraIDPlan -eq "P1" ) -Tag "MT.1012" {
        Test-MtCaMfaForRiskySignIn | Should -Be $true -Because "there is no policy that requires MFA for risky sign-ins"
    }
    It "MT.1013: At least one Conditional Access policy is configured to require new password when user risk is high. See https://maester.dev/docs/tests/MT.1013" -Skip:( $EntraIDPlan -eq "P1" ) -Tag "MT.1013" {
        Test-MtCaRequirePasswordChangeForHighUserRisk | Should -Be $true -Because "there is no policy that requires new password when user risk is high"
    }
    It "MT.1014: At least one Conditional Access policy is configured to require compliant or Entra hybrid joined devices for admins. See https://maester.dev/docs/tests/MT.1014" -Tag "MT.1014" {
        Test-MtCaDeviceComplianceAdminsExists | Should -Be $true -Because "there is no policy that requires compliant or Entra hybrid joined devices for admins"
    }
    It "MT.1015: At least one Conditional Access policy is configured to block access for unknown or unsupported device platforms. See https://maester.dev/docs/tests/MT.1015" -Tag "MT.1015" {
        Test-MtCaBlockUnknownOrUnsupportedDevicePlatform | Should -Be $true -Because "there is no policy that blocks access for unknown or unsupported device platforms"
    }
    It "MT.1016: At least one Conditional Access policy is configured to require MFA for guest access. See https://maester.dev/docs/tests/MT.1016" -Tag "MT.1016" {
        Test-MtCaMfaForGuest | Should -Be $true -Because "there is no policy that requires MFA for guest access"
    }
    It "MT.1017: At least one Conditional Access policy is configured to enforce non persistent browser session for non-corporate devices. See https://maester.dev/docs/tests/MT.1017" -Tag "MT.1017" {
        Test-MtCaEnforceNonPersistentBrowserSession | Should -Be $true -Because "there is no policy that enforces non persistent browser session for non-corporate devices"
    }
    It "MT.1018: At least one Conditional Access policy is configured to enforce sign-in frequency for non-corporate devices. See https://maester.dev/docs/tests/MT.1018" -Tag "MT.1018" {
        Test-MtCaEnforceSignInFrequency | Should -Be $true -Because "there is no policy that enforces sign-in frequency for non-corporate devices"
    }
    It "MT.1019: At least one Conditional Access policy is configured to enable application enforced restrictions. See https://maester.dev/docs/tests/MT.1019" -Tag "MT.1019" {
        Test-MtCaApplicationEnforcedRestriction | Should -Be $true -Because "there is no policy that enables application enforced restrictions"
    }
    It "MT.1020: All Conditional Access policies are configured to exclude directory synchronization accounts or do not scope them. See https://maester.dev/docs/tests/MT.1020" -Tag "MT.1020" {
        Test-MtCaExclusionForDirectorySyncAccount | Should -Be $true -Because "there is no policy that excludes directory synchronization accounts"
    }
    It "MT.1035: All security groups assigned to Conditional Access Policies should be protected by RMAU. See https://maester.dev/docs/tests/MT.1035" -Tag "MT.1035" {
        Test-MtCaGroupsRestricted | Should -Be $true -Because "there are one or more policies without protection of included or excluded groups"
    }
    It "MT.1036: All excluded objects should have a fallback include in another policy. See https://maester.dev/docs/tests/MT.1036" -Tag "MT.1036", "Warning" {
        Test-MtCaGap | Should -Be $true -Because "there are one or more objects excluded without a corresponding fallback in another policy."
    }
    It "MT.1038: Conditional Access policies should not include or exclude deleted groups. See https://maester.dev/docs/tests/MT.1038" -Tag "MT.1038", "Warning" {
        Test-MtCaReferencedGroupsExist | Should -Be $true -Because "there are one or more policies relying on deleted groups."
    }
    It "MT.1049: Conditional Access policies for User Risk and Sign-in Risk should be configured separately. See https://maester.dev/docs/tests/MT.1049" -Tag "MT.1049" {
        Test-MtCaMisconfiguredIDProtection | Should -Be $false -Because "there is one or more policy with common misconfiguration for ID Protection "
    }
    It "MT.1052: At least one Conditional Access policy is targeting the Device Code authentication flow. See https://maester.dev/docs/tests/MT.1052" -Tag "MT.1052" {
        Test-MtCaDeviceCodeFlow | Should -Be $true -Because "there is no policy that targets the device code authentication flow."
    }
    Context "Maester/Entra" -Tag "Entra", "License" {
        It "MT.1022: All users utilizing a P1 license should be licensed. See https://maester.dev/docs/tests/MT.1022" -Tag "MT.1022" {
            $LicenseReport = Test-MtCaLicenseUtilization -License "P1"
            $LicenseReport.TotalLicensesUtilized | Should -BeLessOrEqual $LicenseReport.EntitledLicenseCount -Because "this is the maximium number of user that can utilize a P1 license"
        }
        It "MT.1023: All users utilizing a P2 license should be licensed. See https://maester.dev/docs/tests/MT.1023" -Tag "MT.1023" {
            $LicenseReport = Test-MtCaLicenseUtilization -License "P2"
            $LicenseReport.TotalLicensesUtilized | Should -BeLessOrEqual $LicenseReport.EntitledLicenseCount -Because "this is the maximium number of user that can utilize a P2 license"
        }
    }
}

Describe "Maester/Entra" -Tag "CA", "Security", "All" {
    It "MT.1021: Security Defaults are enabled. See https://maester.dev/docs/tests/MT.1021" -Tag "MT.1021" {
        $EntraIDPlan = Get-MtLicenseInformation -Product EntraID
        if ($EntraIDPlan -ne "Free") {
            Add-MtTestResultDetail -SkippedBecause LicensedEntraIDPremium
        } else {
            $SecurityDefaults = Invoke-MtGraphRequest -RelativeUri "policies/identitySecurityDefaultsEnforcementPolicy" -ApiVersion beta | Select-Object -ExpandProperty isEnabled

            if ($SecurityDefaults -eq $true) {
                $testResultMarkdown = "Well done. SecurityDefaults are On `n`n"
            } else {
                $testResultMarkdown = "SecurityDefaults are Off '$($SecurityDefaults)' `n`n"
            }
            $testDetailsMarkdown = "You should enable SecurityDefaults or configure Conditional Access."
            Add-MtTestResultDetail -Description $testDetailsMarkdown -Result $testResultMarkdown

            $SecurityDefaults | Should -Be $true -Because "Security Defaults are not enabled"
        }
    }
}

# SIG # Begin signature block
# MIIuqAYJKoZIhvcNAQcCoIIumTCCLpUCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDS5kBme87eH7VQ
# WC0tUt3XB6p1DB1QsJim4E2Pq3vqJ6CCE5EwggWQMIIDeKADAgECAhAFmxtXno4h
# MuI5B72nd3VcMA0GCSqGSIb3DQEBDAUAMGIxCzAJBgNVBAYTAlVTMRUwEwYDVQQK
# EwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAfBgNV
# BAMTGERpZ2lDZXJ0IFRydXN0ZWQgUm9vdCBHNDAeFw0xMzA4MDExMjAwMDBaFw0z
# ODAxMTUxMjAwMDBaMGIxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJ
# bmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAfBgNVBAMTGERpZ2lDZXJ0
# IFRydXN0ZWQgUm9vdCBHNDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIB
# AL/mkHNo3rvkXUo8MCIwaTPswqclLskhPfKK2FnC4SmnPVirdprNrnsbhA3EMB/z
# G6Q4FutWxpdtHauyefLKEdLkX9YFPFIPUh/GnhWlfr6fqVcWWVVyr2iTcMKyunWZ
# anMylNEQRBAu34LzB4TmdDttceItDBvuINXJIB1jKS3O7F5OyJP4IWGbNOsFxl7s
# Wxq868nPzaw0QF+xembud8hIqGZXV59UWI4MK7dPpzDZVu7Ke13jrclPXuU15zHL
# 2pNe3I6PgNq2kZhAkHnDeMe2scS1ahg4AxCN2NQ3pC4FfYj1gj4QkXCrVYJBMtfb
# BHMqbpEBfCFM1LyuGwN1XXhm2ToxRJozQL8I11pJpMLmqaBn3aQnvKFPObURWBf3
# JFxGj2T3wWmIdph2PVldQnaHiZdpekjw4KISG2aadMreSx7nDmOu5tTvkpI6nj3c
# AORFJYm2mkQZK37AlLTSYW3rM9nF30sEAMx9HJXDj/chsrIRt7t/8tWMcCxBYKqx
# YxhElRp2Yn72gLD76GSmM9GJB+G9t+ZDpBi4pncB4Q+UDCEdslQpJYls5Q5SUUd0
# viastkF13nqsX40/ybzTQRESW+UQUOsxxcpyFiIJ33xMdT9j7CFfxCBRa2+xq4aL
# T8LWRV+dIPyhHsXAj6KxfgommfXkaS+YHS312amyHeUbAgMBAAGjQjBAMA8GA1Ud
# EwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgGGMB0GA1UdDgQWBBTs1+OC0nFdZEzf
# Lmc/57qYrhwPTzANBgkqhkiG9w0BAQwFAAOCAgEAu2HZfalsvhfEkRvDoaIAjeNk
# aA9Wz3eucPn9mkqZucl4XAwMX+TmFClWCzZJXURj4K2clhhmGyMNPXnpbWvWVPjS
# PMFDQK4dUPVS/JA7u5iZaWvHwaeoaKQn3J35J64whbn2Z006Po9ZOSJTROvIXQPK
# 7VB6fWIhCoDIc2bRoAVgX+iltKevqPdtNZx8WorWojiZ83iL9E3SIAveBO6Mm0eB
# cg3AFDLvMFkuruBx8lbkapdvklBtlo1oepqyNhR6BvIkuQkRUNcIsbiJeoQjYUIp
# 5aPNoiBB19GcZNnqJqGLFNdMGbJQQXE9P01wI4YMStyB0swylIQNCAmXHE/A7msg
# dDDS4Dk0EIUhFQEI6FUy3nFJ2SgXUE3mvk3RdazQyvtBuEOlqtPDBURPLDab4vri
# RbgjU2wGb2dVf0a1TD9uKFp5JtKkqGKX0h7i7UqLvBv9R0oN32dmfrJbQdA75PQ7
# 9ARj6e/CVABRoIoqyc54zNXqhwQYs86vSYiv85KZtrPmYQ/ShQDnUBrkG5WdGaG5
# nLGbsQAe79APT0JsyQq87kP6OnGlyE0mpTX9iV28hWIdMtKgK1TtmlfB2/oQzxm3
# i0objwG2J5VT6LaJbVu8aNQj6ItRolb58KaAoNYes7wPD1N1KarqE3fk3oyBIa0H
# EEcRrYc9B9F1vM/zZn4wggawMIIEmKADAgECAhAIrUCyYNKcTJ9ezam9k67ZMA0G
# CSqGSIb3DQEBDAUAMGIxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJ
# bmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAfBgNVBAMTGERpZ2lDZXJ0
# IFRydXN0ZWQgUm9vdCBHNDAeFw0yMTA0MjkwMDAwMDBaFw0zNjA0MjgyMzU5NTla
# MGkxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjFBMD8GA1UE
# AxM4RGlnaUNlcnQgVHJ1c3RlZCBHNCBDb2RlIFNpZ25pbmcgUlNBNDA5NiBTSEEz
# ODQgMjAyMSBDQTEwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDVtC9C
# 0CiteLdd1TlZG7GIQvUzjOs9gZdwxbvEhSYwn6SOaNhc9es0JAfhS0/TeEP0F9ce
# 2vnS1WcaUk8OoVf8iJnBkcyBAz5NcCRks43iCH00fUyAVxJrQ5qZ8sU7H/Lvy0da
# E6ZMswEgJfMQ04uy+wjwiuCdCcBlp/qYgEk1hz1RGeiQIXhFLqGfLOEYwhrMxe6T
# SXBCMo/7xuoc82VokaJNTIIRSFJo3hC9FFdd6BgTZcV/sk+FLEikVoQ11vkunKoA
# FdE3/hoGlMJ8yOobMubKwvSnowMOdKWvObarYBLj6Na59zHh3K3kGKDYwSNHR7Oh
# D26jq22YBoMbt2pnLdK9RBqSEIGPsDsJ18ebMlrC/2pgVItJwZPt4bRc4G/rJvmM
# 1bL5OBDm6s6R9b7T+2+TYTRcvJNFKIM2KmYoX7BzzosmJQayg9Rc9hUZTO1i4F4z
# 8ujo7AqnsAMrkbI2eb73rQgedaZlzLvjSFDzd5Ea/ttQokbIYViY9XwCFjyDKK05
# huzUtw1T0PhH5nUwjewwk3YUpltLXXRhTT8SkXbev1jLchApQfDVxW0mdmgRQRNY
# mtwmKwH0iU1Z23jPgUo+QEdfyYFQc4UQIyFZYIpkVMHMIRroOBl8ZhzNeDhFMJlP
# /2NPTLuqDQhTQXxYPUez+rbsjDIJAsxsPAxWEQIDAQABo4IBWTCCAVUwEgYDVR0T
# AQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUaDfg67Y7+F8Rhvv+YXsIiGX0TkIwHwYD
# VR0jBBgwFoAU7NfjgtJxXWRM3y5nP+e6mK4cD08wDgYDVR0PAQH/BAQDAgGGMBMG
# A1UdJQQMMAoGCCsGAQUFBwMDMHcGCCsGAQUFBwEBBGswaTAkBggrBgEFBQcwAYYY
# aHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEEGCCsGAQUFBzAChjVodHRwOi8vY2Fj
# ZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkUm9vdEc0LmNydDBDBgNV
# HR8EPDA6MDigNqA0hjJodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRU
# cnVzdGVkUm9vdEc0LmNybDAcBgNVHSAEFTATMAcGBWeBDAEDMAgGBmeBDAEEATAN
# BgkqhkiG9w0BAQwFAAOCAgEAOiNEPY0Idu6PvDqZ01bgAhql+Eg08yy25nRm95Ry
# sQDKr2wwJxMSnpBEn0v9nqN8JtU3vDpdSG2V1T9J9Ce7FoFFUP2cvbaF4HZ+N3HL
# IvdaqpDP9ZNq4+sg0dVQeYiaiorBtr2hSBh+3NiAGhEZGM1hmYFW9snjdufE5Btf
# Q/g+lP92OT2e1JnPSt0o618moZVYSNUa/tcnP/2Q0XaG3RywYFzzDaju4ImhvTnh
# OE7abrs2nfvlIVNaw8rpavGiPttDuDPITzgUkpn13c5UbdldAhQfQDN8A+KVssIh
# dXNSy0bYxDQcoqVLjc1vdjcshT8azibpGL6QB7BDf5WIIIJw8MzK7/0pNVwfiThV
# 9zeKiwmhywvpMRr/LhlcOXHhvpynCgbWJme3kuZOX956rEnPLqR0kq3bPKSchh/j
# wVYbKyP/j7XqiHtwa+aguv06P0WmxOgWkVKLQcBIhEuWTatEQOON8BUozu3xGFYH
# Ki8QxAwIZDwzj64ojDzLj4gLDb879M4ee47vtevLt/B3E+bnKD+sEq6lLyJsQfmC
# XBVmzGwOysWGw/YmMwwHS6DTBwJqakAwSEs0qFEgu60bhQjiWQ1tygVQK+pKHJ6l
# /aCnHwZ05/LWUpD9r4VIIflXO7ScA+2GRfS0YW6/aOImYIbqyK+p/pQd52MbOoZW
# eE4wggdFMIIFLaADAgECAhAP1Kd7fuviGgjvj8ZCqpTVMA0GCSqGSIb3DQEBCwUA
# MGkxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjFBMD8GA1UE
# AxM4RGlnaUNlcnQgVHJ1c3RlZCBHNCBDb2RlIFNpZ25pbmcgUlNBNDA5NiBTSEEz
# ODQgMjAyMSBDQTEwHhcNMjUwNDEwMDAwMDAwWhcNMjgwNzA2MjM1OTU5WjBNMQsw
# CQYDVQQGEwJERTEQMA4GA1UEBxMHSGFtYnVyZzEVMBMGA1UEChMMRmFiaWFuIEJh
# ZGVyMRUwEwYDVQQDEwxGYWJpYW4gQmFkZXIwggIiMA0GCSqGSIb3DQEBAQUAA4IC
# DwAwggIKAoICAQCJI0Z1dyHcnutVp/vdHkC2p3oq9xB8JqGYqLRMR/SoBLgI5i+V
# 3AWxu45/ue9MKtlBRlV5d7UAgVoFd9E/aB/aExr0Oj69sPmuI+O2zPozn6UMc9ci
# tp8L2JRHNpN9KWuA06dmUD/VYPRgqmNtGQFW57XaEJ8klHPDxGuigxzudqJveifK
# QjRoRlSileoVhyjlt6tEyorfRgd1VVWFxkso1qVEjn3ucml+DzrA+ZKiDp//C8+N
# TMu9qMecEsXWPk4qhCla7MO1XpDJb8NE/4WY+PYFrwpxSwiBisWlpA8cgf7i7dhI
# 4P9kTMZz8Cl5OB8/DrsZuv0Fxwmmu88b4uo7nI3HwzfnU/wkNO92g8cywdXHgMDp
# IT++srZXnSQG+Pc4TFAQ8dHHBHxabqTSoZpNYQXQySVSvbpavpcAOhgBg4x2gefD
# Y7Y+iEoLXxwFMIQE908pFHj6+iLlmiKHWLt5eSXtwXoJ83XykFlUXTQ9WW+eo9YI
# lB0GZrwq/4g6nx7mWVG3lIcbfF7oDLUt1d7FhqhWHboYTlRMfkVpOz3TCjma9PY3
# R34n7ejn6cF+kkBK6EX3otlmBtb2sXdPModfceLJbfoU0X1la5tExpQjDHbQ8p/5
# HZLFQ0aGe7BDqBKW3HvIQjw81KMUXBToYvODHXiTNlQl1AZHpZCAf/YnKQIDAQAB
# o4ICAzCCAf8wHwYDVR0jBBgwFoAUaDfg67Y7+F8Rhvv+YXsIiGX0TkIwHQYDVR0O
# BBYEFM+bqr/hMxUPyRKDe3JjUSSVDqK/MD4GA1UdIAQ3MDUwMwYGZ4EMAQQBMCkw
# JwYIKwYBBQUHAgEWG2h0dHA6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzAOBgNVHQ8B
# Af8EBAMCB4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMwgbUGA1UdHwSBrTCBqjBToFGg
# T4ZNaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZEc0Q29k
# ZVNpZ25pbmdSU0E0MDk2U0hBMzg0MjAyMUNBMS5jcmwwU6BRoE+GTWh0dHA6Ly9j
# cmw0LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNENvZGVTaWduaW5nUlNB
# NDA5NlNIQTM4NDIwMjFDQTEuY3JsMIGUBggrBgEFBQcBAQSBhzCBhDAkBggrBgEF
# BQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMFwGCCsGAQUFBzAChlBodHRw
# Oi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkRzRDb2RlU2ln
# bmluZ1JTQTQwOTZTSEEzODQyMDIxQ0ExLmNydDAJBgNVHRMEAjAAMA0GCSqGSIb3
# DQEBCwUAA4ICAQBKBhy38Rsh6QNW5pFN6JD9MFjRO9NBJGtwVo1J4/DGrtBVQuyV
# wQC9eB1LFgUsKcUWb0hjnS2/J0W3sC9Tt9LHVvhyh+g0Vba+kq3hE284I0C33gaG
# P0Orfepx03oSOX/js0OK3+M5f47bSpeOP4t30ms7STRQKK4KQIAN2MBv3uZ0zO/5
# 695DjB9N1chLPEm82Vn6jtdrq3IJTpPBfksd3V8Ex215LiJLeU2E5EuIfiu/PI22
# M8L4zpXkXlZRUXCfppQA7vjQtzFudl2PqqVVb4+4gyAu/bWRNkVx+D6lAN0hMewh
# PiFwKDoPwO+cycQ5I6IaFEHONcEEANov6XoaCxQoIoXMd3tm3VEl5Wr9yXEEL+hn
# CpcPmGE1d1iloJC0/Uf/TCsf1dSYd2vY4aRdess1GAidk2T27SrkmoHpdvZdYdNA
# ts2doFCTyI6sV2c/jYMpL2NJOYWbhq5AxOuu+DLiw1kDsc/KPmrTuSzBGb7nBuJs
# 0QHR4toabNeYUGyKzMJGeibhy434gfyXXLKOWaik8NceybN4M1kROqHL/+PtB5zf
# Z1me2ygRrKtaP6RJXGvc8EcP5CEdlQOL6tiCg2ARMTYNxnsiLN9mRU9hkzo9BSJ4
# Vm+C6RKABzZj0whAObyqL/PceLKuAqvGoXbhGx8fXhKEgbnSoJ3VsqROFjGCGm0w
# ghppAgEBMH0waTELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMu
# MUEwPwYDVQQDEzhEaWdpQ2VydCBUcnVzdGVkIEc0IENvZGUgU2lnbmluZyBSU0E0
# MDk2IFNIQTM4NCAyMDIxIENBMQIQD9Sne37r4hoI74/GQqqU1TANBglghkgBZQME
# AgEFAKCBhDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3DQEJAzEM
# BgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEVMC8GCSqG
# SIb3DQEJBDEiBCDji5V9k4UTT1cN9F+lkW8uXik8vLSlURTFkGU6uoQUozANBgkq
# hkiG9w0BAQEFAASCAgBqtnzCAftvs4kfIvacfNOhlM9PxGMX3fbyJ9jeS+fCAs/M
# oBm1fITLX7gBLxIqSC21YEzfbw4tYWruEHMviCom0NzCj1tny/O6Fw00lWTBIhWI
# u27EgyukWiw242dPWEkFZdwkD1OXclQDpjwdTIDOE2XnmJzVfIYaKPoyRPqrzqpp
# TKF9PXxGIgsavKGPp9c4u7uEZrSQ6X14w7Z1XAWpb99Z+nL2csf96XcUChm4KUBS
# quglz2hJ9vAmkLwwkaBcru/XU7Qw1Cep/fS8DANjeUy31Kp+hfDDxm4sMqV11EyH
# Ae8pRRACBwUmTjzYiifc5yYHMQWzZ85XrLfUESk2K3F7oJO0U3dEiiT9YSojPsRg
# UG6sy5ETJ1Uh0SHKUqjxyBORAnSV/sn1UBtlRovemWhaC7paixtJfujISIqaWb4a
# 7ODN+4vcUKtAQb8SKPM69HQDtCQmxvRIE5vKowLkdHGE3D9mIRqMqJuKF0koUw9s
# hcvJdm7VJrsXl0HoOI+HYVfqK1aZTy3q4e+R6yqG8EfPAjOtGRyphS7+aYEJWF7r
# vECwHEOrlSt6M8rTMsroAbWeEFNpChbSjj0pcJOlXhOFndD0+RjCnMqPQ80NtJQu
# +adlc/Nnk7vrPDdArLsyug0pSewHSzH5sBXiOIXReDd7eu8LmlVcH1NZ9c9+laGC
# Fzowghc2BgorBgEEAYI3AwMBMYIXJjCCFyIGCSqGSIb3DQEHAqCCFxMwghcPAgED
# MQ8wDQYJYIZIAWUDBAIBBQAweAYLKoZIhvcNAQkQAQSgaQRnMGUCAQEGCWCGSAGG
# /WwHATAxMA0GCWCGSAFlAwQCAQUABCDNWZiAQ25/LEzrbeb9vR7OUoCK5SHzT7o8
# Batwf1zK2wIRAL/ukZWZM/SNf/D96/GglaEYDzIwMjUwNTEyMTA0OTU1WqCCEwMw
# gga8MIIEpKADAgECAhALrma8Wrp/lYfG+ekE4zMEMA0GCSqGSIb3DQEBCwUAMGMx
# CzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE7MDkGA1UEAxMy
# RGlnaUNlcnQgVHJ1c3RlZCBHNCBSU0E0MDk2IFNIQTI1NiBUaW1lU3RhbXBpbmcg
# Q0EwHhcNMjQwOTI2MDAwMDAwWhcNMzUxMTI1MjM1OTU5WjBCMQswCQYDVQQGEwJV
# UzERMA8GA1UEChMIRGlnaUNlcnQxIDAeBgNVBAMTF0RpZ2lDZXJ0IFRpbWVzdGFt
# cCAyMDI0MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAvmpzn/aVIauW
# MLpbbeZZo7Xo/ZEfGMSIO2qZ46XB/QowIEMSvgjEdEZ3v4vrrTHleW1JWGErrjOL
# 0J4L0HqVR1czSzvUQ5xF7z4IQmn7dHY7yijvoQ7ujm0u6yXF2v1CrzZopykD07/9
# fpAT4BxpT9vJoJqAsP8YuhRvflJ9YeHjes4fduksTHulntq9WelRWY++TFPxzZrb
# ILRYynyEy7rS1lHQKFpXvo2GePfsMRhNf1F41nyEg5h7iOXv+vjX0K8RhUisfqw3
# TTLHj1uhS66YX2LZPxS4oaf33rp9HlfqSBePejlYeEdU740GKQM7SaVSH3TbBL8R
# 6HwX9QVpGnXPlKdE4fBIn5BBFnV+KwPxRNUNK6lYk2y1WSKour4hJN0SMkoaNV8h
# yyADiX1xuTxKaXN12HgR+8WulU2d6zhzXomJ2PleI9V2yfmfXSPGYanGgxzqI+Sh
# oOGLomMd3mJt92nm7Mheng/TBeSA2z4I78JpwGpTRHiT7yHqBiV2ngUIyCtd0pZ8
# zg3S7bk4QC4RrcnKJ3FbjyPAGogmoiZ33c1HG93Vp6lJ415ERcC7bFQMRbxqrMVA
# Niav1k425zYyFMyLNyE1QulQSgDpW9rtvVcIH7WvG9sqYup9j8z9J1XqbBZPJ5XL
# ln8mS8wWmdDLnBHXgYly/p1DhoQo5fkCAwEAAaOCAYswggGHMA4GA1UdDwEB/wQE
# AwIHgDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMCAGA1Ud
# IAQZMBcwCAYGZ4EMAQQCMAsGCWCGSAGG/WwHATAfBgNVHSMEGDAWgBS6FtltTYUv
# cyl2mi91jGogj57IbzAdBgNVHQ4EFgQUn1csA3cOKBWQZqVjXu5Pkh92oFswWgYD
# VR0fBFMwUTBPoE2gS4ZJaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
# VHJ1c3RlZEc0UlNBNDA5NlNIQTI1NlRpbWVTdGFtcGluZ0NBLmNybDCBkAYIKwYB
# BQUHAQEEgYMwgYAwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNv
# bTBYBggrBgEFBQcwAoZMaHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL0RpZ2lD
# ZXJ0VHJ1c3RlZEc0UlNBNDA5NlNIQTI1NlRpbWVTdGFtcGluZ0NBLmNydDANBgkq
# hkiG9w0BAQsFAAOCAgEAPa0eH3aZW+M4hBJH2UOR9hHbm04IHdEoT8/T3HuBSyZe
# q3jSi5GXeWP7xCKhVireKCnCs+8GZl2uVYFvQe+pPTScVJeCZSsMo1JCoZN2mMew
# /L4tpqVNbSpWO9QGFwfMEy60HofN6V51sMLMXNTLfhVqs+e8haupWiArSozyAmGH
# /6oMQAh078qRh6wvJNU6gnh5OruCP1QUAvVSu4kqVOcJVozZR5RRb/zPd++PGE3q
# F1P3xWvYViUJLsxtvge/mzA75oBfFZSbdakHJe2BVDGIGVNVjOp8sNt70+kEoMF+
# T6tptMUNlehSR7vM+C13v9+9ZOUKzfRUAYSyyEmYtsnpltD/GWX8eM70ls1V6QG/
# ZOB6b6Yum1HvIiulqJ1Elesj5TMHq8CWT/xrW7twipXTJ5/i5pkU5E16RSBAdOp1
# 2aw8IQhhA/vEbFkEiF2abhuFixUDobZaA0VhqAsMHOmaT3XThZDNi5U2zHKhUs5u
# HHdG6BoQau75KiNbh0c+hatSF+02kULkftARjsyEpHKsF7u5zKRbt5oK5YGwFvgc
# 4pEVUNytmB3BpIiowOIIuDgP5M9WArHYSAR16gc0dP2XdkMEP5eBsX7bf/MGN4K3
# HP50v/01ZHo/Z5lGLvNwQ7XHBx1yomzLP8lx4Q1zZKDyHcp4VQJLu2kWTsKsOqQw
# ggauMIIElqADAgECAhAHNje3JFR82Ees/ShmKl5bMA0GCSqGSIb3DQEBCwUAMGIx
# CzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3
# dy5kaWdpY2VydC5jb20xITAfBgNVBAMTGERpZ2lDZXJ0IFRydXN0ZWQgUm9vdCBH
# NDAeFw0yMjAzMjMwMDAwMDBaFw0zNzAzMjIyMzU5NTlaMGMxCzAJBgNVBAYTAlVT
# MRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE7MDkGA1UEAxMyRGlnaUNlcnQgVHJ1
# c3RlZCBHNCBSU0E0MDk2IFNIQTI1NiBUaW1lU3RhbXBpbmcgQ0EwggIiMA0GCSqG
# SIb3DQEBAQUAA4ICDwAwggIKAoICAQDGhjUGSbPBPXJJUVXHJQPE8pE3qZdRodbS
# g9GeTKJtoLDMg/la9hGhRBVCX6SI82j6ffOciQt/nR+eDzMfUBMLJnOWbfhXqAJ9
# /UO0hNoR8XOxs+4rgISKIhjf69o9xBd/qxkrPkLcZ47qUT3w1lbU5ygt69OxtXXn
# HwZljZQp09nsad/ZkIdGAHvbREGJ3HxqV3rwN3mfXazL6IRktFLydkf3YYMZ3V+0
# VAshaG43IbtArF+y3kp9zvU5EmfvDqVjbOSmxR3NNg1c1eYbqMFkdECnwHLFuk4f
# sbVYTXn+149zk6wsOeKlSNbwsDETqVcplicu9Yemj052FVUmcJgmf6AaRyBD40Nj
# gHt1biclkJg6OBGz9vae5jtb7IHeIhTZgirHkr+g3uM+onP65x9abJTyUpURK1h0
# QCirc0PO30qhHGs4xSnzyqqWc0Jon7ZGs506o9UD4L/wojzKQtwYSH8UNM/STKvv
# mz3+DrhkKvp1KCRB7UK/BZxmSVJQ9FHzNklNiyDSLFc1eSuo80VgvCONWPfcYd6T
# /jnA+bIwpUzX6ZhKWD7TA4j+s4/TXkt2ElGTyYwMO1uKIqjBJgj5FBASA31fI7tk
# 42PgpuE+9sJ0sj8eCXbsq11GdeJgo1gJASgADoRU7s7pXcheMBK9Rp6103a50g5r
# mQzSM7TNsQIDAQABo4IBXTCCAVkwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4E
# FgQUuhbZbU2FL3MpdpovdYxqII+eyG8wHwYDVR0jBBgwFoAU7NfjgtJxXWRM3y5n
# P+e6mK4cD08wDgYDVR0PAQH/BAQDAgGGMBMGA1UdJQQMMAoGCCsGAQUFBwMIMHcG
# CCsGAQUFBwEBBGswaTAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQu
# Y29tMEEGCCsGAQUFBzAChjVodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGln
# aUNlcnRUcnVzdGVkUm9vdEc0LmNydDBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8v
# Y3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkUm9vdEc0LmNybDAgBgNV
# HSAEGTAXMAgGBmeBDAEEAjALBglghkgBhv1sBwEwDQYJKoZIhvcNAQELBQADggIB
# AH1ZjsCTtm+YqUQiAX5m1tghQuGwGC4QTRPPMFPOvxj7x1Bd4ksp+3CKDaopafxp
# wc8dB+k+YMjYC+VcW9dth/qEICU0MWfNthKWb8RQTGIdDAiCqBa9qVbPFXONASIl
# zpVpP0d3+3J0FNf/q0+KLHqrhc1DX+1gtqpPkWaeLJ7giqzl/Yy8ZCaHbJK9nXzQ
# cAp876i8dU+6WvepELJd6f8oVInw1YpxdmXazPByoyP6wCeCRK6ZJxurJB4mwbfe
# Kuv2nrF5mYGjVoarCkXJ38SNoOeY+/umnXKvxMfBwWpx2cYTgAnEtp/Nh4cku0+j
# Sbl3ZpHxcpzpSwJSpzd+k1OsOx0ISQ+UzTl63f8lY5knLD0/a6fxZsNBzU+2QJsh
# IUDQtxMkzdwdeDrknq3lNHGS1yZr5Dhzq6YBT70/O3itTK37xJV77QpfMzmHQXh6
# OOmc4d0j/R0o08f56PGYX/sr2H7yRp11LB4nLCbbbxV7HhmLNriT1ObyF5lZynDw
# N7+YAN8gFk8n+2BnFqFmut1VwDophrCYoCvtlUG3OtUVmDG0YgkPCr2B2RP+v6TR
# 81fZvAT6gt4y3wSJ8ADNXcL50CN/AAvkdgIm2fBldkKmKYcJRyvmfxqkhQ/8mJb2
# VVQrH4D6wPIOK+XW+6kvRBVK5xMOHds3OBqhK/bt1nz8MIIFjTCCBHWgAwIBAgIQ
# DpsYjvnQLefv21DiCEAYWjANBgkqhkiG9w0BAQwFADBlMQswCQYDVQQGEwJVUzEV
# MBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29t
# MSQwIgYDVQQDExtEaWdpQ2VydCBBc3N1cmVkIElEIFJvb3QgQ0EwHhcNMjIwODAx
# MDAwMDAwWhcNMzExMTA5MjM1OTU5WjBiMQswCQYDVQQGEwJVUzEVMBMGA1UEChMM
# RGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSEwHwYDVQQD
# ExhEaWdpQ2VydCBUcnVzdGVkIFJvb3QgRzQwggIiMA0GCSqGSIb3DQEBAQUAA4IC
# DwAwggIKAoICAQC/5pBzaN675F1KPDAiMGkz7MKnJS7JIT3yithZwuEppz1Yq3aa
# za57G4QNxDAf8xukOBbrVsaXbR2rsnnyyhHS5F/WBTxSD1Ifxp4VpX6+n6lXFllV
# cq9ok3DCsrp1mWpzMpTREEQQLt+C8weE5nQ7bXHiLQwb7iDVySAdYyktzuxeTsiT
# +CFhmzTrBcZe7FsavOvJz82sNEBfsXpm7nfISKhmV1efVFiODCu3T6cw2Vbuyntd
# 463JT17lNecxy9qTXtyOj4DatpGYQJB5w3jHtrHEtWoYOAMQjdjUN6QuBX2I9YI+
# EJFwq1WCQTLX2wRzKm6RAXwhTNS8rhsDdV14Ztk6MUSaM0C/CNdaSaTC5qmgZ92k
# J7yhTzm1EVgX9yRcRo9k98FpiHaYdj1ZXUJ2h4mXaXpI8OCiEhtmmnTK3kse5w5j
# rubU75KSOp493ADkRSWJtppEGSt+wJS00mFt6zPZxd9LBADMfRyVw4/3IbKyEbe7
# f/LVjHAsQWCqsWMYRJUadmJ+9oCw++hkpjPRiQfhvbfmQ6QYuKZ3AeEPlAwhHbJU
# KSWJbOUOUlFHdL4mrLZBdd56rF+NP8m800ERElvlEFDrMcXKchYiCd98THU/Y+wh
# X8QgUWtvsauGi0/C1kVfnSD8oR7FwI+isX4KJpn15GkvmB0t9dmpsh3lGwIDAQAB
# o4IBOjCCATYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQU7NfjgtJxXWRM3y5n
# P+e6mK4cD08wHwYDVR0jBBgwFoAUReuir/SSy4IxLVGLp6chnfNtyA8wDgYDVR0P
# AQH/BAQDAgGGMHkGCCsGAQUFBwEBBG0wazAkBggrBgEFBQcwAYYYaHR0cDovL29j
# c3AuZGlnaWNlcnQuY29tMEMGCCsGAQUFBzAChjdodHRwOi8vY2FjZXJ0cy5kaWdp
# Y2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURSb290Q0EuY3J0MEUGA1UdHwQ+MDww
# OqA4oDaGNGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJ
# RFJvb3RDQS5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUAA4IB
# AQBwoL9DXFXnOF+go3QbPbYW1/e/Vwe9mqyhhyzshV6pGrsi+IcaaVQi7aSId229
# GhT0E0p6Ly23OO/0/4C5+KH38nLeJLxSA8hO0Cre+i1Wz/n096wwepqLsl7Uz9FD
# RJtDIeuWcqFItJnLnU+nBgMTdydE1Od/6Fmo8L8vC6bp8jQ87PcDx4eo0kxAGTVG
# amlUsLihVo7spNU96LHc/RzY9HdaXFSMb++hUD38dglohJ9vytsgjTVgHAIDyyCw
# rFigDkBjxZgiwbJZ9VVrzyerbHbObyMt9H5xaiNrIv8SuFQtJ37YOtnwtoeW/VvR
# XKwYw02fc7cBqZ9Xql4o4rmUMYIDdjCCA3ICAQEwdzBjMQswCQYDVQQGEwJVUzEX
# MBUGA1UEChMORGlnaUNlcnQsIEluYy4xOzA5BgNVBAMTMkRpZ2lDZXJ0IFRydXN0
# ZWQgRzQgUlNBNDA5NiBTSEEyNTYgVGltZVN0YW1waW5nIENBAhALrma8Wrp/lYfG
# +ekE4zMEMA0GCWCGSAFlAwQCAQUAoIHRMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0B
# CRABBDAcBgkqhkiG9w0BCQUxDxcNMjUwNTEyMTA0OTU1WjArBgsqhkiG9w0BCRAC
# DDEcMBowGDAWBBTb04XuYtvSPnvk9nFIUIck1YZbRTAvBgkqhkiG9w0BCQQxIgQg
# KTgfmZtgM7yoL6XKAWnwW2106yZkgias3WC2msgY23AwNwYLKoZIhvcNAQkQAi8x
# KDAmMCQwIgQgdnafqPJjLx9DCzojMK7WVnX+13PbBdZluQWTmEOPmtswDQYJKoZI
# hvcNAQEBBQAEggIATpTA1hJpv2AFAeHtd02SFjvhwy6vL5PNVhrbiCy9xkdmKzxD
# KiY5Mvdv9c652LVjHGC0lwf5l+/CAWPPvAjAMYVD2rvtXOMwcRK5EVvLKi4PHtpn
# XXV5oVAs6b4Eqglj+xB43kztFdTpJ84QMTmBWMwmfCgCAihf1EpDh/jQu1gUzAwE
# XYT/ecB36cmWKqMLEsazfzXd2koFirppTX7PbZZiWOvZKXnDgBrIdZnBgUxbZDA/
# xal+2mSFbiXqEZ8T5sg3fa3WtQe5Ugm1p9w8yGTOTaMapDiAmtWaZCrVmeKWikMZ
# SCCCPL5QjriINIuqqAY/MnJmTsy7GlyKKbpGDCES02qtOQUWYgehneNkeT/CxV6V
# RMW/G7ZHNbo2exAXawGbwyUeaJq9cPTEkrTSvyTjbAoS9VH/6s4EEnMxxW288Agg
# MSZCR6Dzc2GLfGR/jY+qCkdY4PM0UG5p4HYzHsCiEBdV2PufNkxe6hmJBs0w+7nF
# X5nXgbQtf5xerOx2d+KpN4epJjH+RK+JcL+MPyYLtX6Sio7GbYd0n5P2PMTUljmG
# vacGb117sblNjlHj6XjSXspxai/0ySxfR1vKOiTL7y/aTtElUag9njBBDFohJodD
# 6jAaPjiqkx/RJqL1YFQ8bV/jk9+91GF/q947spV4XyX3JD27PlCLYp3Q/vI=
# SIG # End signature block
