@{
    # Script metadata
    ModuleVersion = '0.1.0-beta'
    GUID = '4a8c98ca-3faa-4390-8c32-ef7baa7b5131'
    Author = 'P6g9YHK6'
    Description = 'A module to perform RDAP queries for domains, IPs, and ASNs.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-RDAPData')
    AliasesToExport = @('whois', 'rdap')
    RequiredModules = @()
    RequiredAssemblies = @()
    PrivateData = @{
        PSData = @{
            Tags = @('RDAP', 'whois', 'network')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://github.com/P6g9YHK6/rdap-ps'
            IconUri = 'https://raw.githubusercontent.com/P6g9YHK6/rdap-ps/refs/heads/main/logo.png'
        }
    }
}
