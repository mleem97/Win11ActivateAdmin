# Administratoraccount aktivieren
Enable-LocalUser -Name "Administrator"

# Passwort für den Administratoraccount festlegen
$Password = Read-Host -AsSecureString -Prompt "Geben Sie das Administratorpasswort ein:"
Set-LocalUser -Name "Administrator" -Password $Password

# Überprüfen, ob der Registrierungsschlüssel existiert, und ihn ggf. erstellen
$Path = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList"
if (!(Test-Path $Path)) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts" -Name "UserList" -ItemType Directory -Force
}

# Administratoraccount vor der Anmeldung verbergen
New-ItemProperty -Path $Path -Name "Administrator" -Value 0 -PropertyType DWORD -Force

# Skriptende Positive
Write-Host "Der Administratoraccount wurde aktiviert, das Passwort wurde festgelegt und der Account wurde vor der Anmeldung verborgen."
