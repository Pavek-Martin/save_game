cls
[string] $scriptName = pwd
$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

$adresar_kam="C:\Users\DELL\Documents\zaloha\save_hry\gta-3\" # <<<<

$exist = Test-Path -Path $adresar_kam
#echo $exist
if ( $exist -ilike "False" ){
echo "chyby cilovy adresar pro zalohu  - $adresar_kam"
sleep 3
Exit
}

$datum = "{0:dd_MM_yyyy-HH_mm_ss}" -f (Get-Date)
$name = "$datum-gta-3_save-backup.zip" # <<<<
echo $adresar_kam$name

Compress-Archive -Path "C:\Users\DELL\Documents\GTA3 User Files" -CompressionLevel Optimal -DestinationPath "$adresar_kam$name"
sleep 5
