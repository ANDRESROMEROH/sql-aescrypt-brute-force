param(
    [Parameter(Mandatory=$true)]
    [string]$fileName,
    [Parameter(Mandatory=$true)] 
    [Int32]$passwordList
)

$passwordsFile = ".\passwords\password_list_" + $passwordList + ".txt"
$errorLog = ".\logs\decrypt_" + $passwordList + ".error"
$tempOutput = ".\decrypted_" +  $passwordList + ".txt"

foreach($password in Get-Content $passwordsFile) {
    Write-Output $password
    & "C:\Program Files\AESCrypt\aescrypt.exe" -d -p $password -o $tempOutput $fileName 2> $errorLog
    
    if (Test-Path -Path $tempOutput) {
        Rename-Item -Path $tempOutput -NewName "final.txt"
        Write-Output $password > clave.log
        Stop-Process -Name "powershell"
    }
}

