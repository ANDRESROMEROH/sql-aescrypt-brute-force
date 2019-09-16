param(
    [Parameter(Mandatory=$true)] 
    [string]$fileName #Recibir el nombre de archivo a desencriptar, ej: test.txt.aes
)

$cantPasswords = 167000 #Cantidad de claves por hilo
$min = 1 #Bandera para definir el min del rango
$max = $cantPasswords #Bandera para definir el max del rango

Write-Output "Generando las claves usando la base de datos..."

# Iterar 10 veces para producir 10 listas de claves
for ($i = 0; $i -lt 10; $i++) {
    & sqlplus.exe system/root "@do_passwords.sql" $i $min $max > $null
    $min = $max + 1
    $max = $max + $cantPasswords
    Write-Output ("Se ha generado el archivo de claves #{0}" -f $i)
}

# Iterar 10 veces para producir 10 hilos de ejecucion paralelos
for ($i = 0; $i -lt 10; $i++) {
    # Ejecutar el hilo en paralelo
    # Se pasa por parametro el nombre del archivo y el numero de
    # la lista de claves a utilizar para desencriptar
    Start-Process -FilePath "powershell" -ArgumentList ".\do_decrypt.ps1", $fileName, $i
}

Write-Output ("Desencriptando el archivo: {0} en 'FINAL'..." -f $fileName)