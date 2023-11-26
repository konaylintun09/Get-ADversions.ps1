PS C:\> # Exchange Schema Version
PS C:\> $sc = (Get-ADRootDSE).SchemaNamingContext
PS C:\> $ob = "CN=ms-Exch-Schema-Version-Pt," + $sc
PS C:\> Write-Output "RangeUpper: $((Get-ADObject $ob -pr rangeUpper).rangeUpper)"
RangeUpper: 15332
 
PS C:\> # Exchange Object Version (domain)
PS C:\> $dc = (Get-ADRootDSE).DefaultNamingContext
PS C:\> $ob = "CN=Microsoft Exchange System Objects," + $dc
PS C:\> Write-Output "ObjectVersion (Default): $((Get-ADObject $ob -pr objectVersion).objectVersion)"
ObjectVersion (Default): 13237
 
PS C:\> # Exchange Object Version (forest)
PS C:\> $cc = (Get-ADRootDSE).ConfigurationNamingContext
PS C:\> $fl = "(objectClass=msExchOrganizationContainer)"
PS C:\> Write-Output "ObjectVersion (Configuration): $((Get-ADObject -LDAPFilter $fl -SearchBase $cc -pr objectVersion).objectVersion)"
ObjectVersion (Configuration): 16217
