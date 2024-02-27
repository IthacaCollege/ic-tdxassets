
# Parameter help description
[CmdletBinding()]
param (
    [Parameter()]
    [String]
    $token
)

if (! $token) {
    $token = Read-Host "Please enter your bearer token"  
}


$endpoint = "https://help.ithaca.edu/TDWebApi/api/reports/1966?withData=true"
# Grab a token string from https://help.ithaca.edu/TDWebApi/api/auth/loginsso
# Replace YOUR_BEARER_TOKEN with the token string


$headers = @{
    "Authorization" = "Bearer $token"
    "Content-Type" = "application/json"
}

#TODO: FUNCTION: Test bearer token expiration and refresh if needed

# Get a REST response
$response = Invoke-WebRequest -Uri $endpoint -Headers $headers -Method Get

# Output the response content in pretty Json format
$jsonObject = $response | ConvertFrom-Json
$jsonObject

# Select the SerialNumber property and output
$serialNumbers = $jsonObject.DataRows | Select-Object -ExpandProperty SerialNumber
$serialNumbers