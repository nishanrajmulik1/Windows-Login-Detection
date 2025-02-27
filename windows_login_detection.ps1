# PowerShell Script to Retrieve Windows Security Log Events

# Get all successful login attempts (Event ID 4624)
Write-Host "Fetching Successful Logins..."
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4624} | Select-Object TimeCreated, Message | Format-Table -AutoSize

# Get all failed login attempts (Event ID 4625)
Write-Host "Fetching Failed Logins..."
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625} | Select-Object TimeCreated, Message | Format-Table -AutoSize

# Check for multiple failed attempts (Brute-force detection)
Write-Host "Analyzing Brute-Force Attack Patterns..."
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625} | Group-Object -Property Message | Sort-Object Count -Descending | Format-Table -AutoSize

