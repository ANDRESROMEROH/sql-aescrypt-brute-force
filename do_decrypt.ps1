param(
    [Parameter(Mandatory=$true)]
    [string]$fileName, #Recibir el nombre del archivo
    [Parameter(Mandatory=$true)] 
    [Int32]$passwordList #Recibir el numero de la lista de claves
)

$passwordsFile = ".\passwords\password_list_" + $passwordList + ".txt" #Ruta a la lista de claves indicada
$errorLog = ".\logs\decrypt_" + $passwordList + ".error" #Ruta al folder de logs para los errores

#Nombre temporal del archivo luego de desencriptar
#Esto para que no interfiera con otros hilos de ejecucion
#que pueden estar utilizando AESCRYPT.exe
$tempOutput = ".\decrypted_" +  $passwordList + ".txt"

#Loop para recorrer clave por clave en el archivo
foreach($password in Get-Content $passwordsFile) {
    Write-Output $password

    #Ejecutar accion para desencriptar utilizando la clave actual
    & "C:\Program Files\AESCrypt\aescrypt.exe" -d -p $password -o $tempOutput $fileName 2> $errorLog
    
    if (Test-Path -Path $tempOutput) { #Si existe el archivo de salida el proceso ha sido exitoso
        Rename-Item -Path $tempOutput -NewName "final.txt" #Se renombra el archivo desencriptado
        Write-Output $password > clave.log #Se guarda la clave utilizada
        Stop-Process -Name "powershell" #Se eliminan todos los hilos de ejecucion
    }
}
