# Activate Administrator account
Enable-LocalUser -Name "Administrator"

# Set password for the Administrator account
$Password = Read-Host -AsSecureString -Prompt "Enter the Administrator password:"
Set-LocalUser -Name "Administrator" -Password $Password

# Check if the registry key exists, and create it if necessary
$Path = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList"
 if (!(Test-Path $Path)) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts" -Name "UserList" -ItemType Directory -Force
}

# Hide the Administrator account from the login screen
New-ItemProperty -Path $Path -Name "Administrator" -Value 0 -PropertyType DWORD -Force

# Script end Positive
Write-Host "The Administrator account has been activated, the password has been set, and the account has been hidden from the login screen."
 
