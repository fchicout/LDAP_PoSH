#Load the assemblies 
Add-Type -AssemblyName System.DirectoryServices -ErrorAction Stop
Add-Type -AssemblyName System.Net -ErrorAction Stop

function New-LDAPSession{

param(
    [String]$Server, 
    [String]$Login,
    [uint16]$Port=389,
    [String]$Password,
    [boolean]$TLSEnabled=$true,
    [boolean]$SSLEnabled=$false
    )
    $c = New-Object System.DirectoryServices.Protocols.LdapConnection("$Server"+ ":" +"$Port")
    $c.AuthType = [System.DirectoryServices.Protocols.AuthType]::Basic
    $c.Credential = New-Object "System.Net.NetworkCredential" -ArgumentList $Login,$Password
    try{
        $c.Bind()
        return $c
    } catch {
        Write-Error $_.Exception
    }
}

function Close-LDAPSession{
param(
    [System.DirectoryServices.Protocols.LdapConnection]$Connection
    )
    $Connection.Dispose()

}

function Get-LDAPSchemas{
param()
    $request = New-Object System.DirectoryServices.Protocols.SearchRequest("dc=ufpe,dc=br", "subschemaSubentry", [System.DirectoryServices.SearchScope]::Base, "cn=schema")
    $cc.SendRequest($request).Entries.Attributes
}

function List-LDAPSchemas{
param()

}

function Set-LDAPSchemas{
param()

}

function Remove-LDAPSchemas{
param()

}

function List-LDAPObject{
param()

}


#Export-ModuleMember -Function 'New-LDAPSession'
