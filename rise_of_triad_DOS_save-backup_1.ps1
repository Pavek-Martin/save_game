﻿cls
[string] $scriptName = pwd
$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

$adresar_kam="C:\Users\DELL\Documents\zaloha\save_hry\rise_of_triad_DOS\"
$exist = Test-Path -Path $adresar_kam
#echo $exist
if ( $exist -ilike "False" ){
echo "chyby cilovy adresar pro zalohu  - $adresar_kam"
sleep 3
Exit
}

$datum = "{0:dd_MM_yyyy-HH_mm_ss}" -f (Get-Date)
$name = "$datum-rise_of_triad_DOS_save-backup.zip"
echo $adresar_kam$name

$hvezdicka="*"
echo "mazu stare zalohy $adresar_kam"
Remove-Item -Path $adresar_kam$hvezdicka -Force
sleep 2

Compress-Archive -Path "C:\Users\DELL\Documents\Dos\HRY\ROOT/*.ROT" -CompressionLevel Optimal -DestinationPath "$adresar_kam$name"
Compress-Archive -Path "C:\Users\DELL\Documents\Dos\HRY\ROOT/*.arj" -CompressionLevel Optimal -Update -DestinationPath "$adresar_kam$name"
sleep 3

