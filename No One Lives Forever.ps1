cls
[string] $scriptName = pwd
$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

$adresar_kam="C:\Users\DELL\Documents\zaloha\save_hry\No_One_Lives_Forever\"
$exist = Test-Path -Path $adresar_kam
#echo $exist
if ( $exist -ilike "False" ){
echo "chyby cilovy adresar pro zalohu  - $adresar_kam"
Timeout /t 3
Exit
}

$datum = "{0:dd_MM_yyyy-HH_mm_ss}" -f (Get-Date)

$name="$datum-No_One_Lives_Forever_save-backup.zip"

echo $adresar_kam$name

Compress-Archive -Path "C:\Program Files\No_One_Lives_Forever\Save\" -CompressionLevel Optimal -DestinationPath "$adresar_kam$name"
Start-Sleep -Seconds 3
