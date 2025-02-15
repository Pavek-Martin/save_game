# Windows 10 PoweShell ver. 1.0
Clear-Host #cls
[string] $scriptName = pwd
$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

$adresar_kam="C:\Users\DELL\Documents\zaloha\save_hry\warcraft_3\"
$exist = Test-Path -Path $adresar_kam
#echo $exist
if ( $exist -ilike "False" ){
echo "chyby cilovy adresar pro zalohu  - $adresar_kam"
Timeout /t 3
Exit
}

$datum = "{0:dd_MM_yyyy-HH_mm_ss}" -f (Get-Date)
$name="$datum-warcraft-3_save-backup.zip"
echo $adresar_kam$name

$hvezdicka="*"
echo "mazu stare zalohy $adresar_kam"
Remove-Item -Path $adresar_kam$hvezdicka -Force
sleep 2

Compress-Archive -Path "C:\Program Files (x86)\Warcraft III\save" -CompressionLevel Optimal -DestinationPath "$adresar_kam$name"
Start-Sleep -Seconds 3

# c:\Users\DELL\AppData\Local\VirtualStore\Program Files (x86)\Warcraft III\save\
# nejky save data sjou pak jeste i tady ???

