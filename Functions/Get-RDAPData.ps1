function Get-RDAPData {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Query,
        
        [Parameter()]
        [ValidateSet('domain', 'ip', 'autnum')]
        [string]$Type = 'domain'
    )

    # Determine the appropriate RDAP URL based on the query type
    switch ($Type) {
        'domain' {
            $url = "https://rdap.org/domain/$Query"
        }
        'ip' {
            $url = "https://rdap.org/ip/$Query"
        }
        'autnum' {
            $url = "https://rdap.org/autnum/$Query"
        }
        default {
            throw "Unsupported RDAP type."
        }
    }

    try {
        # Perform the RDAP query
        $response = Invoke-RestMethod -Uri $url -Method Get

        if (-not $response) {
            throw "No RDAP data returned for $Query."
        }

        # Return the response as an object
        return $response
    } catch {
        Write-Error "Failed to retrieve RDAP data for $Query. Error: $_"

        # Optionally suggest fixes based on common issues
        if ($_.Exception.Message -like '*404*') {
            Write-Error "The query might be invalid or unsupported by the RDAP server."
        } elseif ($_.Exception.Message -like '*network*') {
            Write-Error "Check your internet connection and try again."
        }
    }
}
