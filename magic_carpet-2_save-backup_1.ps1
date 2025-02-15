﻿cls
[string] $scriptName = pwd
$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

$adresar_kam="C:\Users\DELL\Documents\zaloha\save_hry\magic_carpet_2\"
$exist = Test-Path -Path $adresar_kam
#echo $exist
if ( $exist -ilike "False" ){
echo "chyby cilovy adresar pro zalohu  - $adresar_kam"
sleep 3
Exit
}

$datum = "{0:dd_MM_yyyy-HH_mm_ss}" -f (Get-Date)
$name = "$datum-magic_carpet-2_save-backup.zip"
echo $adresar_kam$name

Compress-Archive -Path "C:\GOG Games\Magic Carpet 2\cloud_saves\" -CompressionLevel Optimal -DestinationPath "$adresar_kam$name"
sleep 3
