# Get the list of running processes ending with .exe
$processes = Get-Process

# Initialize an empty array to hold our custom objects
$data = @()

# Loop through each process and add a custom object to the array
foreach ($proc in $processes) {
    $data += @{
        "{#PROCESSNAME}" = $proc.Name
    }
}

# Format the data into a JSON structure for discovery
$discoveryData = @{
    "data" = $data
} | ConvertTo-Json -Compress

# Output the discovery data
Write-Host $discoveryData