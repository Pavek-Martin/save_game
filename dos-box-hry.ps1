cls
[string] $scriptName = pwd
$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

$adresar_kam="C:\Users\DELL\Documents\zaloha\ruzne\"
$exist = Test-Path -Path $adresar_kam
#echo $exist
if ( $exist -ilike "False" ){
echo "chyby cilovy adresar pro zalohu  - $adresar_kam"
sleep 3
Exit
}

$datum = "{0:dd_MM_yyyy-HH_mm_ss}" -f (Get-Date)
$name = "$datum-dos-box-save-game-all-backup.zip"
echo $adresar_kam$name

<#
Compress-Archive -Path "C:\Users\DELL\Documents\zaloha\save_hry\_DOS-BOX_HRY\" -CompressionLevel Optimal -DestinationPath "$adresar_kam$name"
sleep 2
Remove-Item -Path "C:\Users\DELL\Documents\zaloha\save_hry\_DOS-BOX_HRY\*" -Recurse -Force
sleep 2
#>

#Compress-Archive -Path "R:\DOS-BOX_HRY\" -CompressionLevel Optimal -DestinationPath "$adresar_kam$name"
Compress-Archive -Path "C:\work\DOS-BOX_HRY\" -CompressionLevel Optimal -DestinationPath "$adresar_kam$name"
sleep 2
Remove-Item -Path "C:\work\DOS-BOX_HRY" -Recurse -Force
sleep 2

