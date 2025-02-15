cls
[string] $scriptName = pwd
$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

$adresar_kam="C:\Users\DELL\Documents\zaloha\save_hry\tomb_raider_angels_of_darknes\"
$exist = Test-Path -Path $adresar_kam
#echo $exist
if ( $exist -ilike "False" ){
echo "chyby cilovy adresar pro zalohu  - $adresar_kam"
Timeout /t 3
Exit
}

$datum = "{0:dd_MM_yyyy-HH_mm_ss}" -f (Get-Date)

$name="$datum-tomb_raider_angels_of_darknes_save-backup.zip"

echo $adresar_kam$name

Compress-Archive -Path "C:\Program Files (x86)\Eidos Interactive\TRAOD\SaveGame" -CompressionLevel Optimal -DestinationPath "$adresar_kam$name"
Start-Sleep -Seconds 3
