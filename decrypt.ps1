param(
    [Parameter(Mandatory=$true)]
    [string]$fileName
)

$cantPasswords = 167000
$min = 1
$max = $cantPasswords

Write-Output "Generando las claves usando la base de datos..."

for ($i = 0; $i -lt 10; $i++) {
    & sqlplus.exe system/root "@do_passwords.sql" $i $min $max > $null
    $min = $max + 1
    $max = $max + $cantPasswords
    Write-Output ("Se ha generado el archivo de claves #{0}" -f $i)
}

for ($i = 0; $i -lt 10; $i++) {
    # Ejecutar el job en paralelo
    Start-Process -FilePath "powershell" -ArgumentList ".\do_decrypt.ps1", $fileName, $i
}

Write-Output ("Desencriptando el archivo: {0} en 'FINAL'..." -f $fileName)